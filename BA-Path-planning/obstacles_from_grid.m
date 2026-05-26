function obstacles = obstacles_from_grid(maskOrFile, startPoint, goalPoint, minDist, origin)
% OBSTACLES_FROM_GRID
% maskOrFile : logical mask (MxN, true=blocked) OR path to .mat OR []
%              If empty or a .mat path is provided, loads insideBW from mat.
% start/goal : [x y] in mm, same coordinate system as plotting
% minDist    : scalar (mm)
% origin     : 'top-left' (default, Y down) or 'bottom-left' (Y up)

    if nargin < 5 || isempty(origin), origin = 'top-left'; end

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
    
    % Mask should already be in correct format: true = obstacles to extract
    % No automatic inversion - caller is responsible for mask polarity
    [nRows, nCols] = size(mask);

    % --- Table geometry (mm) ---
    TABLE_W = 725;   % X extent (mm)
    TABLE_H = 575;   % Y extent (mm)
    cw = TABLE_W / nCols;   % cell width
    ch = TABLE_H / nRows;   % cell height

    rects = zeros(0,4);

    % Build rectangles by merging contiguous blocked cells horizontally per row
    for r = 1:nRows
        row = mask(r, :);
        c = 1;
        while c <= nCols
            if row(c)
                cStart = c;
                while c <= nCols && row(c)
                    c = c + 1;
                end
                cEnd = c - 1;

                xmin = (cStart - 1) * cw;
                width = (cEnd - cStart + 1) * cw;
                switch lower(origin)
                    case 'top-left'
                        ymin = (r - 1) * ch;
                        height = ch;
                    case 'bottom-left'
                        ymin = TABLE_H - r * ch;
                        height = ch;
                    otherwise
                        error('origin must be ''top-left'' or ''bottom-left''.');
                end

                rect = [xmin, ymin, width, height];
                if rect_point_distance(rect, startPoint) < minDist
                    continue;
                end
                if rect_point_distance(rect, goalPoint)  < minDist
                    continue;
                end
                rects(end+1,:) = rect; %#ok<AGROW>
            else
                c = c + 1;
            end
        end
    end

    obstacles = rects;
end

% Helper: distance from point to axis-aligned rectangle (0 if inside/touching)
function d = rect_point_distance(rect, pt)
    xmin = rect(1); ymin = rect(2);
    xmax = xmin + rect(3);
    ymax = ymin + rect(4);
    dx = max([xmin - pt(1), 0, pt(1) - xmax]);
    dy = max([ymin - pt(2), 0, pt(2) - ymax]);
    d  = hypot(dx, dy);
end

% Try to find a suitable logical BW mask from a loaded struct
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
