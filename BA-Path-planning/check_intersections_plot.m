function check_intersections_plot(x, y)
    % Plots the path and detects intersections between line segments

    n = length(x);
    figure;
    plot(x, y, 'b-o', 'LineWidth', 2); grid on; hold on;
    xlabel('Y-axis (horizontal)');
    ylabel('X-axis (vertical)');
    title('Path with Intersection Detection');
    axis equal;

    found = false;

    for i = 1:n-2
        for j = i+2:n-1
            % Skip adjacent or overlapping segments
            if i == 1 && j == n-1
                continue;  % skip if closed loop
            end

            % Define two line segments:
            A1 = [x(i), y(i)];
            A2 = [x(i+1), y(i+1)];
            B1 = [x(j), y(j)];
            B2 = [x(j+1), y(j+1)];

            % Check intersection and get point if it exists
            [intersects, P] = isIntersecting(A1, A2, B1, B2);

            if intersects
                found = true;
                fprintf('Intersection between segments %d–%d and %d–%d\n', ...
                    i, i+1, j, j+1);
                plot(P(1), P(2), 'ko', 'MarkerSize', 10, ...
                     'MarkerFaceColor', 'm');  % purple dot
            end
        end
    end

    if ~found
        disp('No intersections detected.');
    end
end

function [intersects, P] = isIntersecting(p1, p2, p3, p4)
    % Determines if segments (p1–p2) and (p3–p4) intersect.
    % Returns true/false and intersection point P (if any).

    d1 = direction(p3, p4, p1);
    d2 = direction(p3, p4, p2);
    d3 = direction(p1, p2, p3);
    d4 = direction(p1, p2, p4);

    intersects = (d1 * d2 < 0) && (d3 * d4 < 0);
    P = [NaN, NaN];

    if intersects
        P = computeIntersection(p1, p2, p3, p4);
    end
end

function d = direction(a, b, c)
    % Computes the direction (cross product) of point c relative to line a–b
    d = (c(1) - a(1)) * (b(2) - a(2)) - (c(2) - a(2)) * (b(1) - a(1));
end

function P = computeIntersection(p1, p2, p3, p4)
    % Calculates intersection point of segments (p1–p2) and (p3–p4)
    x1 = p1(1); y1 = p1(2);
    x2 = p2(1); y2 = p2(2);
    x3 = p3(1); y3 = p3(2);
    x4 = p4(1); y4 = p4(2);

    A = [x2 - x1, -(x4 - x3);
         y2 - y1, -(y4 - y3)];
    b = [x3 - x1;
         y3 - y1];

    if abs(det(A)) < 1e-10
        P = [NaN, NaN];  % Parallel or collinear
    else
        t = A \ b;
        xi = x1 + t(1) * (x2 - x1);
        yi = y1 + t(1) * (y2 - y1);
        P = [xi, yi];
    end
end
