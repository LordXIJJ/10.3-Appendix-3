% Returns 1 if the lines intersect, otherwise 0. In addition, if the lines 
% intersect the intersection point may be stored in the floats i_x and i_y.

function [val, i_x, i_y] = get_line_intersection(All_xs, All_ys)
    val = 0;
    i_x = 0;
    i_y = 0;
    n = length(All_xs);

    for i = 1:n - 2  % Loop over each segment start point
        p0_x = All_xs(i);
        p0_y = All_ys(i);
        p1_x = All_xs(i + 1);
        p1_y = All_ys(i + 1);

        s1_x = p1_x - p0_x;
        s1_y = p1_y - p0_y;

        for j = i + 2:n - 1  % Check against all *later* segments
            p2_x = All_xs(j);
            p2_y = All_ys(j);
            p3_x = All_xs(j + 1);
            p3_y = All_ys(j + 1);

            s2_x = p3_x - p2_x;
            s2_y = p3_y - p2_y;

            denom = (-s2_x * s1_y + s1_x * s2_y);
            if denom == 0
                continue; % Segments are parallel, no intersection
            end

            s = (-s1_y * (p0_x - p2_x) + s1_x * (p0_y - p2_y)) / denom;
            t = ( s2_x * (p0_y - p2_y) - s2_y * (p0_x - p2_x)) / denom;

            if (s >= 0 && s <= 1 && t >= 0 && t <= 1)
                % Intersection detected
                i_x = p0_x + (t * s1_x);
                i_y = p0_y + (t * s1_y);
                val = 1;
                return; % Exit as soon as one intersection is found
            end
        end
    end
end
