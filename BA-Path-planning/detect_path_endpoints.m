function [startPoint, goalPoint] = detect_path_endpoints(maskOrFile, origin)
% DETECT_PATH_ENDPOINTS  Automatically detect start and end points from path mask.
% Usage:
%   [start, goal] = detect_path_endpoints(insideBW);
%   [start, goal] = detect_path_endpoints('insideBW.mat');
%   [start, goal] = detect_path_endpoints(insideBW, 'bottom-left');
%
% Input:
%   maskOrFile : logical mask (MxN, true=path) OR path to .mat OR []
%                If empty, loads insideBW.mat
%   origin     : 'top-left' (default) or 'bottom-left'
%
% Output:
%   startPoint : [x, y] in mm
%   goalPoint  : [x, y] in mm

    if nargin < 2 || isempty(origin), origin = 'top-left'; end

    % Resolve mask input
    if nargin < 1 || isempty(maskOrFile)
        S = load('insideBW.mat');
        mask = resolve_bw_from_struct(S);
    elseif ischar(maskOrFile) || (isstring(maskOrFile) && isscalar(maskOrFile))
        S = load(char(maskOrFile));
        mask = resolve_bw_from_struct(S);
    else
        mask = maskOrFile;
    end

    if ~islogical(mask), mask = logical(mask); end
    [nRows, nCols] = size(mask);

    % Check mask polarity by looking for largest connected component
    % If largest component is mostly true, assume true=path (correct)
    % If largest component is mostly false, assume we need to invert
    fracTrue = nnz(mask) / numel(mask);
    fprintf('Mask statistics: %.1f%% are true pixels.\n', fracTrue*100);
    
    % Try to find largest connected component to verify polarity
    try
        CC = bwconncomp(mask, 8);
        if CC.NumObjects > 0
            numPixels = cellfun(@numel, CC.PixelIdxList);
            largestSize = max(numPixels);
            largestFrac = largestSize / numel(mask);
            fprintf('Largest connected component: %.1f%% of image.\n', largestFrac*100);
            
            % If largest component is very small (< 5%), likely wrong polarity
            if largestFrac < 0.05 && fracTrue > 0.5
                warning('Largest component is very small but most pixels are true. Inverting mask.');
                mask = ~mask;
                fprintf('Inverted mask. Now %.1f%% are true (path pixels).\n', nnz(mask)/numel(mask)*100);
            end
        end
    catch
        % Skip polarity check if bwconncomp fails
    end

    % Table geometry (mm) - must match obstacles_from_grid
    TABLE_W = 725;   % X extent (mm)
    TABLE_H = 575;   % Y extent (mm)
    cw = TABLE_W / nCols;   % cell width
    ch = TABLE_H / nRows;   % cell height

    % Find the largest connected component (main path)
    % This ensures we get endpoints from the main path, not small disconnected regions
    try
        CC = bwconncomp(mask, 8);
        if CC.NumObjects == 0
            error('No white path found in mask. Check mask polarity.');
        end
        
        % Find the largest component
        numPixels = cellfun(@numel, CC.PixelIdxList);
        [~, largestIdx] = max(numPixels);
        
        % Create mask with only the largest component
        mainPath = false(size(mask));
        mainPath(CC.PixelIdxList{largestIdx}) = true;
        
        fprintf('Using largest connected component with %d pixels (out of %d total)\n', ...
            numPixels(largestIdx), nnz(mask));
    catch
        % Fallback: use mask as-is
        warning('Could not find connected components. Using entire mask.');
        mainPath = mask;
    end

    % Method 1: Find boundary of the path and get the two farthest points
    % This works well for large blobs and avoids edge artifacts
    try
        % Get boundary of the main path
        boundary = bwperim(mainPath, 8);
        [boundRows, boundCols] = find(boundary);
        
        if length(boundRows) >= 2
            % Find the two boundary points that are farthest apart
            maxDist = 0;
            idx1 = 1;
            idx2 = 1;
            for i = 1:length(boundRows)
                for j = i+1:length(boundRows)
                    dist = hypot(boundRows(i) - boundRows(j), boundCols(i) - boundCols(j));
                    if dist > maxDist
                        maxDist = dist;
                        idx1 = i;
                        idx2 = j;
                    end
                end
            end
            epRows = [boundRows(idx1); boundRows(idx2)];
            epCols = [boundCols(idx1); boundCols(idx2)];
            fprintf('Found endpoints from boundary: distance = %.1f pixels\n', maxDist);
        else
            error('Boundary too small');
        end
    catch
        % Method 2: Skeletonize and find skeleton endpoints
        try
            skel = bwmorph(mainPath, 'skel', Inf);
            fprintf('Using skeletonization method\n');
        catch
            skel = mainPath;
        end
        
        % Find endpoints: pixels with exactly 1 neighbor
        endpoints = false(size(skel));
        [rows, cols] = find(skel);
        
        % Filter out points too close to image edges (likely artifacts)
        edgeMargin = min(5, round(min(nRows, nCols) * 0.02)); % 2% margin or 5 pixels
        
        for i = 1:length(rows)
            r = rows(i);
            c = cols(i);
            
            % Skip if too close to edge
            if r <= edgeMargin || r > nRows - edgeMargin || ...
               c <= edgeMargin || c > nCols - edgeMargin
                continue;
            end
            
            % Count 8-connected neighbors
            neighborCount = 0;
            for dr = -1:1
                for dc = -1:1
                    if dr == 0 && dc == 0, continue; end
                    r2 = r + dr;
                    c2 = c + dc;
                    if r2 >= 1 && r2 <= nRows && c2 >= 1 && c2 <= nCols
                        if skel(r2, c2)
                            neighborCount = neighborCount + 1;
                        end
                    end
                end
            end
            
            % Endpoint has exactly 1 neighbor
            if neighborCount == 1
                endpoints(r, c) = true;
            end
        end
        
        % Get all endpoint coordinates
        [epRows, epCols] = find(endpoints);
        
        if length(epRows) < 2
            % Fallback: find two farthest points on skeleton, avoiding edges
            [allRows, allCols] = find(skel);
            % Filter out edge points
            valid = (allRows > edgeMargin) & (allRows <= nRows - edgeMargin) & ...
                    (allCols > edgeMargin) & (allCols <= nCols - edgeMargin);
            allRows = allRows(valid);
            allCols = allCols(valid);
            
            if length(allRows) < 2
                % Last resort: use all skeleton points
                [allRows, allCols] = find(skel);
            end
            
            if length(allRows) < 2
                error('Path mask is too small or empty. Cannot detect endpoints.');
            end
            
            % Find the two points with maximum distance
            maxDist = 0;
            idx1 = 1;
            idx2 = 1;
            for i = 1:length(allRows)
                for j = i+1:length(allRows)
                    dist = hypot(allRows(i) - allRows(j), allCols(i) - allCols(j));
                    if dist > maxDist
                        maxDist = dist;
                        idx1 = i;
                        idx2 = j;
                    end
                end
            end
            
            epRows = [allRows(idx1); allRows(idx2)];
            epCols = [allCols(idx1); allCols(idx2)];
            fprintf('Found endpoints from skeleton (farthest apart): distance = %.1f pixels\n', maxDist);
        elseif length(epRows) > 2
            % Multiple endpoints: pick the two that are farthest apart
            maxDist = 0;
            idx1 = 1;
            idx2 = 1;
            for i = 1:length(epRows)
                for j = i+1:length(epRows)
                    dist = hypot(epRows(i) - epRows(j), epCols(i) - epCols(j));
                    if dist > maxDist
                        maxDist = dist;
                        idx1 = i;
                        idx2 = j;
                    end
                end
            end
            epRows = [epRows(idx1); epRows(idx2)];
            epCols = [epCols(idx1); epCols(idx2)];
            fprintf('Found %d skeleton endpoints, selected farthest pair: distance = %.1f pixels\n', ...
                length(epRows)+length(epCols)-2, maxDist);
        else
            fprintf('Found 2 skeleton endpoints: distance = %.1f pixels\n', ...
                hypot(epRows(1)-epRows(2), epCols(1)-epCols(2)));
        end
    end

    % Convert pixel coordinates to mm
    % Column (X): same in both conventions
    x1 = (epCols(1) - 0.5) * cw;  % center of cell
    x2 = (epCols(2) - 0.5) * cw;
    
    switch lower(origin)
        case 'top-left'
            y1 = (epRows(1) - 0.5) * ch;
            y2 = (epRows(2) - 0.5) * ch;
        case 'bottom-left'
            y1 = TABLE_H - (epRows(1) - 0.5) * ch;
            y2 = TABLE_H - (epRows(2) - 0.5) * ch;
        otherwise
            error('origin must be ''top-left'' or ''bottom-left''.');
    end

    % Determine which is start and which is goal
    % Convention: start is typically top-left or leftmost, goal is bottom-right or rightmost
    % But we'll use a simple heuristic: start = point with smaller x+y, goal = larger x+y
    % Or: start = top-left-ish, goal = bottom-right-ish
    sum1 = x1 + y1;
    sum2 = x2 + y2;
    
    if sum1 < sum2
        startPoint = [x1, y1];
        goalPoint = [x2, y2];
    else
        startPoint = [x2, y2];
        goalPoint = [x1, y1];
    end
end

% Helper: try to find a suitable logical BW mask from a loaded struct
function mask = resolve_bw_from_struct(S)
    if isfield(S,'insideBW')
        mask = S.insideBW;
        return;
    end
    if isfield(S,'BW')
        mask = S.BW;
        return;
    end
    % Fallback: first logical array in struct
    fn = fieldnames(S);
    for i = 1:numel(fn)
        v = S.(fn{i});
        if islogical(v) && ndims(v) == 2
            mask = v; return;
        end
    end
    error('No logical 2D mask found in provided MAT file. Expected variable insideBW.');
end

