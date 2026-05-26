function obstacles = generate_obstacles ()
nObstacles = 9;
obstacles = zeros(nObstacles,3);
x = [1.5   5       4   7       1.2     6       7       7       8];
y = [4.5   6       3   1       1.5     2.5     4       8       6];
r = [1.5   0.8     1   0.8     0.8     0.5     0.8     0.8     0.8];
% for i = 1:nObstacles
%         % Generate random position
%         x(i) = x(i);  % X of Base is 0 to 525mm
%         y(i) = y(i);  % Y of Base is 0 to 725mm
%         r(i) = r(i);  % Random radius between 1mm and 51mm
% 
%         % Check distance from start and goal points
%         distToStart = norm([x(i),y(i)] - startPoint);
%         distToGoal = norm([x(i),y(i)] - goalPoint);
% 
%         if distToStart > minDist && distToGoal > minDist
%             obstacles(i,:) = [x(i), y(i), r(i)];
% 
%         end
% end

% Save obstacle configuration
%save(fullfile(resultsDir, 'obstacles.mat'), 'obstacles');

end

Center	Radius	
(1.5, 4.5)	1.5	
(5.0, 6.0)	0.8
(4.0, 3.0)	1	
(7.0, 1.0)	0.8
(1.2, 1.5)	0.8	
(6.0, 2.5)	0.5
(7.0, 4.0)	0.8	
(7.0, 8.0)	0.8
(8.0, 6.0)	0.8