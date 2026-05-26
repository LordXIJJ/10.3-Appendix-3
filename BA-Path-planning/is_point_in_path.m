function inPath = is_point_in_path(point, pathMask, origin)
% IS_POINT_IN_PATH  Check if a point (in mm) is within the white path area.
% Usage:
%   inPath = is_point_in_path([x, y], insideBW);
%   inPath = is_point_in_path([x, y], insideBW, 'bottom-left');
%
% Input:
%   point    : [x, y] in mm
%   pathMask : logical mask (MxN), true = white path area
%   origin   : 'top-left' (default) or 'bottom-left'
%
% Output:
%   inPath   : true if point is within white path area

    if nargin < 3 || isempty(origin), origin = 'top-left'; end
    
    if ~islogical(pathMask), pathMask = logical(pathMask); end
    [nRows, nCols] = size(pathMask);
    
    % Table geometry (mm) - must match obstacles_from_grid
    TABLE_W = 725;   % X extent (mm)
    TABLE_H = 575;   % Y extent (mm)
    cw = TABLE_W / nCols;   % cell width
    ch = TABLE_H / nRows;   % cell height
    
    % Convert mm to pixel coordinates
    col = round(point(1) / cw) + 1;  % +1 for 1-based indexing
    col = max(1, min(col, nCols));    % clamp to valid range
    
    switch lower(origin)
        case 'top-left'
            row = round(point(2) / ch) + 1;
        case 'bottom-left'
            row = round((TABLE_H - point(2)) / ch) + 1;
        otherwise
            error('origin must be ''top-left'' or ''bottom-left''.');
    end
    row = max(1, min(row, nRows));    % clamp to valid range
    
    % Check if this pixel is in the white path area
    inPath = pathMask(row, col);
end

