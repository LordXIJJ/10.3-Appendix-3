function population = initializePopulation(nBees, nControlPoints, startPoint, goalPoint, pathMask, origin)
    % Initialize population of bees with random paths
    % Each bee represents a path with nControlPoints control points
    % Control points are constrained to be within the white path area
    
    if nargin < 6 || isempty(origin), origin = 'top-left'; end
    
    % Calculate bounds for control points
    xMin = min(startPoint(1), goalPoint(1));
    xMax = max(startPoint(1), goalPoint(1));
    yMin = min(startPoint(2), goalPoint(2));
    yMax = max(startPoint(2), goalPoint(2));
    
    % Expand bounds slightly to allow more sampling
    xRange = xMax - xMin;
    yRange = yMax - yMin;
    xMin = max(0, xMin - 0.1 * xRange);
    xMax = min(725, xMax + 0.1 * xRange);
    yMin = max(0, yMin - 0.1 * yRange);
    yMax = min(575, yMax + 0.1 * yRange);
    
    % Initialize population matrix
    % Each row represents one bee (path)
    % Each path has nControlPoints control points, each with x,y coordinates
    population = zeros(nBees, nControlPoints * 2);
    
    % Generate random paths for each bee
    for i = 1:nBees
        % Generate random control points
        for j = 1:nControlPoints
            maxAttempts = 1000;  % Prevent infinite loop
            attempts = 0;
            while attempts < maxAttempts
                x = xMin + (xMax-xMin)*rand();
                y = yMin + (yMax-yMin)*rand();
                point = [x, y];
                
                % Check if point is in path (if pathMask provided)
                if nargin >= 5 && ~isempty(pathMask)
                    if is_point_in_path(point, pathMask, origin)
                        population(i, 2*j-1) = x;
                        population(i, 2*j) = y;
                        break;
                    end
                else
                    % No constraint, use point as-is
                    population(i, 2*j-1) = x;
                    population(i, 2*j) = y;
                    break;
                end
                attempts = attempts + 1;
            end
            
            if attempts >= maxAttempts
                warning('Could not find valid point in path after %d attempts. Using unconstrained point.', maxAttempts);
                population(i, 2*j-1) = xMin + (xMax-xMin)*rand();
                population(i, 2*j) = yMin + (yMax-yMin)*rand();
            end
        end
    end
end 