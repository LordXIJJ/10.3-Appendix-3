function plotBestPath(agent, startPoint, goalPoint, obstacles)
    % Plot the current best solution
    
    % Clear current figure
    clf;
    hold on;
    
    % Plot obstacles
    for i = 1:size(obstacles,1)
        circle(obstacles(i,1), obstacles(i,2), obstacles(i,3));
    end
    
    % Extract and plot path
    path = reshape(agent, 2, [])';
    path = [startPoint; path; goalPoint];
    
    plot(path(:,1), path(:,2), 'b-', 'LineWidth', 2);
    xlabel('X-axis');
    ylabel('Y-axis');
    set(gca, 'YDir', 'normal');
    
    % Plot control points
    plot(path(:,1), path(:,2), 'ro', 'MarkerSize', 8);
    
    % Plot start and goal points
    plot(startPoint(1), startPoint(2), 'gs', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
    plot(goalPoint(1), goalPoint(2), 'rs', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
    
    % Set axis limits and grid
    axis([0 10 0 10]); % Strictly limit to base bounds
    axis equal;
    set(gca, 'XLim', [-1 11], 'YLim', [-1 11]); % Extra enforcement
    
    % Draw the surface border
    % rectangle('Position', [0, 0, 10, 10], 'EdgeColor', 'k', 'LineWidth', 1);
    
    
    xticks(0:1:10);
    yticks(0:1:10);
    grid on;
end

function circle(x,y,r)
    % Draw a circle
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    fill(xunit, yunit, [0.8 0.8 0.8], 'EdgeColor', 'k');
end 