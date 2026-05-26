function found = check_intersections(x, y)
    % x and y: vectors of control point coordinates
    n = length(x);
    found = false;

    % Loop through all segment pairs
    for i = 1:n-2
        for j = i+2:n-1
            % Skip adjacent segments or segments sharing a point
            if i == 1 && j == n-1
                continue;  % optionally skip start-end if path is closed
            end

            % Extract line segments
            A1 = [x(i), y(i)];
            A2 = [x(i+1), y(i+1)];
            B1 = [x(j), y(j)];
            B2 = [x(j+1), y(j+1)];

            % Check if they intersect
            if isIntersecting(A1, A2, B1, B2)
                disp(['Intersection found between segments ', num2str(i), ' and ', num2str(j)]);
                found = true;
            end
        end
    end

    if ~found
        disp('No intersections detected.');
    end
end

function result = isIntersecting(p1, p2, p3, p4)
    % Checks if line segments (p1,p2) and (p3,p4) intersect

    % Convert to vector form
    d1 = direction(p3, p4, p1);
    d2 = direction(p3, p4, p2);
    d3 = direction(p1, p2, p3);
    d4 = direction(p1, p2, p4);

    result = ((d1 * d2 < 0) && (d3 * d4 < 0));
end

function d = direction(a, b, c)
    % Cross product direction
    d = (c(1) - a(1)) * (b(2) - a(2)) - (c(2) - a(2)) * (b(1) - a(1));
end
