function plotObstacles(startPoint, goalPoint, obstacles)
    % Plot the current best solution
    
    % Clear current figure
    clf;
    hold on;
    
    % Plot obstacles
    for i = 1:size(obstacles,1)
        circle(obstacles(i,1), obstacles(i,2), obstacles(i,3));
    end
  
    
    % Plot start and goal points
    plot(startPoint(1), startPoint(2), 'bs', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
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
    % fill(xunit, yunit, [0.8 0.8 0.8], 'EdgeColor', 'k');
    fill(xunit, yunit, [0.8 0.8 0.8],"FaceColor", 'k');
end 