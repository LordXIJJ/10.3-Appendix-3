function newBee = localSearch(bee, radius, pathMask, origin)
    % Perform local search around a given solution
    % radius: search radius (smaller for elite sites, larger for best sites)
    % Control points are constrained to be within the white path area
    
    if nargin < 4 || isempty(origin), origin = 'top-left'; end
    
    % Add random perturbation to each control point
    newBee = bee;
    nControlPoints = length(bee) / 2;
    
    for j = 1:nControlPoints
        maxAttempts = 100;
        attempts = 0;
        while attempts < maxAttempts
            x = bee(2*j-1) + radius * (2*rand() - 1);
            y = bee(2*j) + radius * (2*rand() - 1);
            
            % Clamp to table bounds
            x = max(0, min(725, x));
            y = max(0, min(575, y));
            
            point = [x, y];
            
            % Check if point is in path (if pathMask provided)
            if nargin >= 3 && ~isempty(pathMask)
                if is_point_in_path(point, pathMask, origin)
                    newBee(2*j-1) = x;
                    newBee(2*j) = y;
                    break;
                end
            else
                % No constraint, use point as-is
                newBee(2*j-1) = x;
                newBee(2*j) = y;
                break;
            end
            attempts = attempts + 1;
        end
        
        % If couldn't find valid point, keep original
        if attempts >= maxAttempts
            newBee(2*j-1) = bee(2*j-1);
            newBee(2*j) = bee(2*j);
        end
    end
end 