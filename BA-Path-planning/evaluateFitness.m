function fitness = evaluateFitness(population, startPoint, goalPoint, obstacles)
% Supports:
%   obstacles Kx3 : circles [xc yc r]
%   obstacles Kx4 : rectangles [xmin ymin width height] (axis-aligned)

    nBees = size(population, 1);
    fitness = zeros(nBees, 1);

    % You can tweak these:
    bigPenalty = 1e6;         % for self-intersection or hard collision
    rectClearance = 10;        % mm extra clearance around rectangles (0 = exact)

    for i = 1:nBees
        % Build full polyline
        path = reshape(population(i,:), 2, [])';
        path = [startPoint; path; goalPoint];

        % Path length
        pathLength = sum(vecnorm(diff(path,1,1),2,2));

        % Self-intersection penalty (your function)
        intersectionPenalty = 0;
        a = get_line_intersection(path(:,1), path(:,2));  
        if a
            intersectionPenalty = bigPenalty;
        end

        % Obstacle penalty
        obstaclePenalty = 0;
        for j = 1:size(path,1)-1
            p1 = path(j,:); p2 = path(j+1,:);

            if isempty(obstacles), continue; end

            if size(obstacles,2) == 3
                % ----- circles -----
                for k = 1:size(obstacles,1)
                    oc = obstacles(k,1:2);
                    r  = obstacles(k,3);
                    d = pointToLineDistance(p1, p2, oc);
                    if d < r
                        obstaclePenalty = obstaclePenalty + (r - d)^2;
                    end
                end

            elseif size(obstacles,2) == 4
                % ----- rectangles -----
                for k = 1:size(obstacles,1)
                    rect = obstacles(k,1:4);  % [xmin ymin w h]
                    [d, hit] = segmentRectDistance(p1, p2, rect);
                    if hit
                        obstaclePenalty = obstaclePenalty + bigPenalty;
                    elseif d < rectClearance
                        obstaclePenalty = obstaclePenalty + (rectClearance - d)^2;
                    end
                end

            else
                error('Obstacles must be Kx3 (circles) or Kx4 (rectangles).');
            end
        end

        % Total fitness
        fitness(i) = pathLength + 100 * obstaclePenalty + intersectionPenalty;
    end
end

function d = pointToLineDistance(p1, p2, point)
    v = p2 - p1; w = point - p1;
    t = dot(w,v) / dot(v,v);
    if t < 0
        d = norm(point - p1);
    elseif t > 1
        d = norm(point - p2);
    else
        d = norm(point - (p1 + t * v));
    end
end

% ---- Geometry helpers for rectangles ----

function [d, hit] = segmentRectDistance(p1, p2, rect)
% Distance from segment p1-p2 to axis-aligned rectangle.
% Returns:
%   d   >= 0 minimal distance (0 if touching/intersecting)
%   hit = true if segment intersects rectangle interior/boundary

    xmin = rect(1); ymin = rect(2);
    xmax = xmin + rect(3);
    ymax = ymin + rect(4);

    % Quick inside test
    if pointInRect(p1, xmin,ymin,xmax,ymax) || pointInRect(p2, xmin,ymin,xmax,ymax)
        d = 0; hit = true; return;
    end

    % Edges as segments
    e1a = [xmin ymin]; e1b = [xmax ymin]; % bottom
    e2a = [xmax ymin]; e2b = [xmax ymax]; % right
    e3a = [xmax ymax]; e3b = [xmin ymax]; % top
    e4a = [xmin ymax]; e4b = [xmin ymin]; % left

    % Intersections?
    if segmentsIntersect(p1,p2,e1a,e1b) || segmentsIntersect(p1,p2,e2a,e2b) || ...
       segmentsIntersect(p1,p2,e3a,e3b) || segmentsIntersect(p1,p2,e4a,e4b)
        d = 0; hit = true; return;
    end

    % No intersection: distance is min of segment-segment distances to edges
    d = min([ segSegDist(p1,p2,e1a,e1b), ...
              segSegDist(p1,p2,e2a,e2b), ...
              segSegDist(p1,p2,e3a,e3b), ...
              segSegDist(p1,p2,e4a,e4b) ]);
    hit = false;
end

function inside = pointInRect(p, xmin,ymin,xmax,ymax)
    inside = (p(1) >= xmin) && (p(1) <= xmax) && (p(2) >= ymin) && (p(2) <= ymax);
end

function d = segSegDist(A,B,C,D)
% Minimal distance between two segments AB and CD
    if segmentsIntersect(A,B,C,D)
        d = 0; return;
    end
    d = min([ pointSegDist(A,C,D), pointSegDist(B,C,D), ...
              pointSegDist(C,A,B), pointSegDist(D,A,B) ]);
end

function d = pointSegDist(P, A, B)
% point to segment distance
    v = B - A; w = P - A;
    t = dot(w,v) / dot(v,v);
    if t <= 0
        d = norm(P - A);
    elseif t >= 1
        d = norm(P - B);
    else
        d = norm(P - (A + t*v));
    end
end

function tf = segmentsIntersect(A,B,C,D)
% Proper segment intersection (including touching)
    tf = false;
    o1 = orient(A,B,C); o2 = orient(A,B,D);
    o3 = orient(C,D,A); o4 = orient(C,D,B);
    if (o1*o2 <= 0) && (o3*o4 <= 0)
        % Colinearity needs bounding-box overlap check
        if o1==0 && o2==0 && o3==0 && o4==0
            tf = bboxOverlap(A,B,C,D);
        else
            tf = true;
        end
    end
end

function o = orient(a,b,c)
% Orientation sign of triangle (a,b,c)
    v = (b - a);
    w = (c - a);
    val = v(1)*w(2) - v(2)*w(1);
    % Tolerance to treat almost-colinear as colinear
    eps = 1e-12;
    if abs(val) < eps, val = 0; end
    o = sign(val);
end

function tf = bboxOverlap(A,B,C,D)
% 1D overlap in both axes for colinear segments
    minAB = min(A,B); maxAB = max(A,B);
    minCD = min(C,D); maxCD = max(C,D);
    tf = (minAB(1) <= maxCD(1)) && (maxAB(1) >= minCD(1)) && ...
         (minAB(2) <= maxCD(2)) && (maxAB(2) >= minCD(2));
end

% function fitness = evaluateFitness(population, startPoint, goalPoint, obstacles)
%     % Evaluate fitness of each path in the population
%     % Lower fitness is better
% 
%     nBees = size(population, 1);
%     fitness = zeros(nBees, 1);
% 
%     for i = 1:nBees
%         % Extract control points for current path
%         path = reshape(population(i,:), 2, [])';
%         path = [startPoint; path; goalPoint];
% 
%         % Calculate path length
%         pathLength = 0;
%         intersectionPenalty = 0;
%         for j = 1:size(path,1)-1
%             pathLength = pathLength + norm(path(j+1,:) - path(j,:));
% 
%         end
%         % a = check_intersections(path(:,1),path(:,2));
%         a = get_line_intersection(path(:,1), path(:,2));
%         if a
%             intersectionPenalty = 1000000;
%         end
%         % Calculate obstacle penalty
%         obstaclePenalty = 0;
%         for j = 1:size(path,1)-1
%             for k = 1:size(obstacles,1)
%                 % Calculate minimum distance from line segment to obstacle
%                 d = pointToLineDistance(path(j,:), path(j+1,:), obstacles(k,1:2));
%                 if d < obstacles(k,3)
%                     obstaclePenalty = obstaclePenalty + (obstacles(k,3) - d)^2;
%                 end
%             end
%         end
% 
%         % Total fitness (path length + obstacle penalty)
%         fitness(i) = pathLength + 100 * obstaclePenalty + intersectionPenalty;
%     end
% end
% 
% function d = pointToLineDistance(p1, p2, point)
%     % Calculate minimum distance from point to line segment
%     v = p2 - p1;
%     w = point - p1;
% 
%     % Project w onto v
%     proj = dot(w,v) / dot(v,v);
% 
%     if proj < 0
%         d = norm(point - p1);
%     elseif proj > 1
%         d = norm(point - p2);
%     else
%         d = norm(point - (p1 + proj * v));
%     end
% end 