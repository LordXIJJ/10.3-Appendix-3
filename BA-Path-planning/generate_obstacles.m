function obstacles = generate_obstacles(startPoint, goalPoint, minDist, gridBlocked, origin)
% GENERATE_OBSTACLES  Build obstacles from a 24x30 grid, preserving shapes/holes.
% Usage:
%   obs = generate_obstacles(startPoint, goalPoint, minDist);
%   obs = generate_obstacles(startPoint, goalPoint, minDist, gridBlocked);
%   obs = generate_obstacles(startPoint, goalPoint, minDist, gridBlocked, 'bottom-left');
%
% Returns Kx4 rectangles [xmin ymin width height] that approximate the union
% of blocked cells. Gaps and non-rectangular shapes are preserved by merging
% horizontally per row (no hole filling or closing).

	if nargin < 5 || isempty(origin), origin = 'top-left'; end

	% Try to get gridBlocked from input or from saved mat
	if nargin < 4 || isempty(gridBlocked)
		try
			S = load('gridBlocked.mat');
			if isfield(S,'gridBlocked')
				gridBlocked = S.gridBlocked;
			else
				error('gridBlocked.mat found but variable "gridBlocked" missing.');
			end
		except
			error('gridBlocked not provided and gridBlocked.mat not found.');
		end
	end

	gridBlocked = logical(gridBlocked);
	[nRows, nCols] = size(gridBlocked);

	% Table extents (mm) — align with rest of codebase
	TABLE_W = 725;   % X extent (mm)
	TABLE_H = 575;   % Y extent (mm)
	cw = TABLE_W / nCols;   % cell width
	ch = TABLE_H / nRows;   % cell height

	rects = zeros(0,4);

	% Build rectangles by merging contiguous blocked cells horizontally per row
	for r = 1:nRows
		row = gridBlocked(r, :);
		c = 1;
		while c <= nCols
			if row(c)
				cStart = c;
				while c <= nCols && row(c)
					c = c + 1;
				end
				cEnd = c - 1;
				% Map cell-run (r, cStart:cEnd) to rectangle in mm
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
				% Skip rectangles too close to start/goal
				if rect_point_distance(rect, startPoint) < minDist
					continue;
				end
				if rect_point_distance(rect, goalPoint) < minDist
					continue;
				end
				rects(end+1, :) = rect; %#ok<AGROW>
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