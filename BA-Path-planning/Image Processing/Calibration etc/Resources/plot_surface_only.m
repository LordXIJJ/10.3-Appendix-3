% plot_surface_only.m
% Draw a 525 mm x 725 mm rectangular surface with 25 mm grid
% Labels shown every 125 mm only

figure('Color', 'w'); clf; hold on;

% Axis limits and aspect
axis([0 525 0 725]);
axis equal;
set(gca, 'XLim', [0 525], 'YLim', [0 725]);
set(gca, 'YDir', 'reverse'); % Match original orientation (optional)

% Draw surface border
rectangle('Position', [0, 0, 525, 725], 'EdgeColor', 'k', 'LineWidth', 2);

% Grid every 25 mm
xticks(0:25:525);
yticks(0:25:725);
grid on; box on;

% Label only every 125 mm
xTickVals = 0:25:525;
yTickVals = 0:25:725;
xLabels = repmat({''}, size(xTickVals));
yLabels = repmat({''}, size(yTickVals));
x125 = 0:125:525;
y125 = 0:125:725;
[~, xIdx] = ismember(x125, xTickVals);
[~, yIdx] = ismember(y125, yTickVals);
for i = 1:length(xIdx), xLabels{xIdx(i)} = num2str(x125(i)); end
for i = 1:length(yIdx), yLabels{yIdx(i)} = num2str(y125(i)); end
xticklabels(xLabels);
yticklabels(yLabels);

xlabel('X-axis (mm)');
ylabel('Y-axis (mm)');
title('Rectangular Surface (525 x 725 mm)');