function fitness = Evaluate_Fitness(population, startPoint, goalPoint, obstacles)
    % Evaluate fitness of each path in the population
    % Lower fitness is better
    
    pop = size(population, 1);
    fitness = zeros(pop, 1);
    
    for i = 1:pop
        % Extract control points for current path
        path = reshape(population(i,:), 2, [])';
        path = [startPoint; path; goalPoint];
        
        % Calculate path length
        pathLength = 0;
        for j = 1:size(path,1)-1
            pathLength = pathLength + norm(path(j+1,:) - path(j,:));
            
        end

        % Calculate obstacle penalty
        obstaclePenalty = 0;
        obstacleCollision = false;
        for j = 1:size(path,1)-1
            for k = 1:size(obstacles,1)
                % Calculate minimum distance from line segment to obstacle
                d = pointToLineDistance(path(j,:), path(j+1,:), obstacles(k,1:2));
                if d < obstacles(k,3)
                    obstaclePenalty = obstaclePenalty + (obstacles(k,3) - d)^2;
                    obstacleCollision = true;
                end
            end
        end
        if obstacleCollision
            collisionPenalty = 1e3;
        else
            collisionPenalty = 0;
        end
        
        % Total fitness (path length + obstacle penalty)
        fitness(i) = pathLength + 100 * obstaclePenalty + collisionPenalty;
    end
end

function d = pointToLineDistance(p1, p2, point)
    % Calculate minimum distance from point to line segment
    v = p2 - p1;
    w = point - p1;
    
    % Project w onto v
    proj = dot(w,v) / dot(v,v);
    
    if proj < 0
        d = norm(point - p1);
    elseif proj > 1
        d = norm(point - p2);
    else
        d = norm(point - (p1 + proj * v));
    end
end 