function plotSolution(bee, startPoint, goalPoint, obstacles)
    % World / grid params
    TABLE_W = 725;   % mm in X
    TABLE_H = 575;   % mm in Y
    GRID_MM = 25;    % grid step for ticks/lines
    LABEL_STEP = 125;

    % Prepare figure
    clf; hold on; axis equal;
    xlim([0 TABLE_W]); ylim([0 TABLE_H]);
    set(gca, 'YDir','reverse');% bottom-left origin, +Y up
    box on;

    % --- Draw surface border
    rectangle('Position',[0 0 TABLE_W TABLE_H], 'EdgeColor','k', 'LineWidth', 2);

    % --- Light grid (every 25 mm), labels every 125 mm
    xt = 0:GRID_MM:TABLE_W;
    yt = 0:GRID_MM:TABLE_H;
    set(gca,'XTick',xt,'YTick',yt);
    % label only every 125
    xlabels = repmat({''}, size(xt));
    ylabels = repmat({''}, size(yt));
    xL = 0:LABEL_STEP:TABLE_W; yL = 0:LABEL_STEP:TABLE_H;
    [~,xi] = ismember(xL, xt); [~,yi] = ismember(yL, yt);
    for k=1:numel(xi), xlabels{xi(k)} = num2str(xL(k)); end
    for k=1:numel(yi), ylabels{yi(k)} = num2str(yL(k)); end
    set(gca,'XTickLabel',xlabels, 'YTickLabel',ylabels);
    grid on;

    % --- Plot obstacles (supports Kx3 circles or Kx4 rectangles)
    if ~isempty(obstacles)
        if size(obstacles,2) == 3
            % circles: [xc yc r]
            for i = 1:size(obstacles,1)
                drawCircle(obstacles(i,1), obstacles(i,2), obstacles(i,3));
            end
        elseif size(obstacles,2) == 4
            % rects: [xmin ymin w h]
            for i = 1:size(obstacles,1)
                drawRect(obstacles(i,1), obstacles(i,2), obstacles(i,3), obstacles(i,4));
            end
        else
            warning('Obstacles must be Kx3 (circles) or Kx4 (rectangles). Skipping.');
        end
    end

    % --- Path: start -> control points -> goal
    path = reshape(bee, 2, [])';
    path = [startPoint; path; goalPoint];

    plot(path(:,1), path(:,2), 'b-', 'LineWidth', 2);
    plot(path(:,1), path(:,2), 'ro', 'MarkerSize', 7, 'MarkerFaceColor','r');

    % Start/Goal
    plot(startPoint(1), startPoint(2), 'gs', 'MarkerSize', 9, 'MarkerFaceColor', 'g');
    plot(goalPoint(1),  goalPoint(2),  'ms', 'MarkerSize', 9, 'MarkerFaceColor', 'm');

    xlabel('X (mm)'); ylabel('Y (mm)');
    title('Path with Obstacles');
end

function drawCircle(xc,yc,r)
    th = linspace(0,2*pi,100);
    x = xc + r*cos(th);
    y = yc + r*sin(th);
    patch(x, y, [0.8 0.8 0.8], 'EdgeColor','k'); % filled light gray
end

function drawRect(xmin,ymin,w,h)
    x = [xmin xmin+w xmin+w xmin];
    y = [ymin ymin ymin+h ymin+h];
    patch(x, y, [0.8 0.8 0.8], 'EdgeColor','k');
end

% function plotSolution(bee, startPoint, goalPoint, obstacles)
%     % Plot the current best solution
% 
%     % Clear current figure
%     clf;
%     hold on;
% 
%     % Plot obstacles
%     for i = 1:size(obstacles,1)
%         circle(obstacles(i,1), obstacles(i,2), obstacles(i,3));
%     end
% 
%     % Extract and plot path
%     path = reshape(bee, 2, [])';
%     path = [startPoint; path; goalPoint];
% 
%     plot(path(:,1), path(:,2), 'b-', 'LineWidth', 2);
%     xlabel('X-axis');
%     ylabel('Y-axis');
%     set(gca, 'YDir', 'reverse');
% 
%     % Plot control points
%     plot(path(:,1), path(:,2), 'ro', 'MarkerSize', 8);
% 
%     % Plot start and goal points
%     plot(startPoint(1), startPoint(2), 'gs', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
%     plot(goalPoint(1), goalPoint(2), 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
% 
%     % Set axis limits and grid
%     axis([0 525 0 725]); % Strictly limit to base bounds
%     axis equal;
%     set(gca, 'XLim', [0 575], 'YLim', [0 725]); % Extra enforcement
% 
%     % Draw the surface border
%     rectangle('Position', [0, 0, 575, 725], 'EdgeColor', 'k', 'LineWidth', 2);
% 
%     % Grid every 25 mm, but label only every 125 mm
%     xticks(0:25:575);
%     yticks(0:25:725);
%     xticklabels(arrayfun(@(x) num2str(x), 0:125:575, 'UniformOutput', false));
%     yticklabels(arrayfun(@(y) num2str(y), 0:125:725, 'UniformOutput', false));
%     % To only label every 125 mm, set empty labels for in-between ticks
%     xTickVals = 0:25:575;
%     yTickVals = 0:25:725;
%     xLabels = repmat({''}, size(xTickVals));
%     yLabels = repmat({''}, size(yTickVals));
%     x125 = 0:125:575;
%     y125 = 0:125:725;
%     [~, xIdx] = ismember(x125, xTickVals);
%     [~, yIdx] = ismember(y125, yTickVals);
%     for i = 1:length(xIdx), xLabels{xIdx(i)} = num2str(x125(i)); end
%     for i = 1:length(yIdx), yLabels{yIdx(i)} = num2str(y125(i)); end
%     xticklabels(xLabels);
%     yticklabels(yLabels);
%     grid on;
% end
% 
% function circle(x,y,r)
%     % Draw a circle
%     th = 0:pi/50:2*pi;
%     xunit = r * cos(th) + x;
%     yunit = r * sin(th) + y;
%     fill(xunit, yunit, [0.8 0.8 0.8], 'EdgeColor', 'k');
% end 