% Main script for Bees Algorithm Path Planning
% clear all;
% close all;
% clc;

% Create timestamped results directory
% timestamp = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
% resultsDir = ['Test_Results/Test_results_run_at_', timestamp];
% if ~exist(resultsDir, 'dir')
%     mkdir(resultsDir);
% end
function bestPath = Call_Bees(maxIter)
% Parameters
nBees = 50;          % Number of bees
nElite = 5;          % Number of elite sites
nBest = 5;          % Number of best sites
nEliteBees = 5;     % Number of bees for elite sites
nBestBees = 3;       % Number of bees for best sites
%maxIter = 10;       % Maximum iterations
nControlPoints = 3;  % Number of control points for path

% Environment setup
load ('C:\Users\hfsul\Documents\GitHub\BA-Path-planning\insideBW.mat');

% Generate random obstacles
%nObstacles = 3;  % Number of obstacles
% In original image: white=true (light), false=black (dark)
% We want points on the dark areas (false in original), so invert for pathMask
pathMask = ~insideBW;  % Dark areas (false in original) = path to follow (true in pathMask)
obstacleMask = insideBW;  % Light areas (true in original) = obstacles to extract

% Automatically detect start and end points from the dark path areas
[startPoint, goalPoint] = detect_path_endpoints(pathMask);
fprintf('Auto-detected start point: [%.1f, %.1f] mm\n', startPoint(1), startPoint(2));
fprintf('Auto-detected goal point:  [%.1f, %.1f] mm\n', goalPoint(1), goalPoint(2));

% Verify start and goal points are within the dark path area
% if ~is_point_in_path(startPoint, pathMask)
%     warning('Start point is not in dark path area!');
% end
% if ~is_point_in_path(goalPoint, pathMask)
%     warning('Goal point is not in dark path area!');
% end
nObstacles = count_obstacles(obstacleMask);
%nControlPoints = nObstacles;
%obstacles = zeros(nObstacles, 3);  % [x, y, radius]

% Keep obstacles away from start and goal points
minDist = 0;  % Minimum distance from start/goal points
%obstacles = generate_obstacles (startPoint,goalPoint, minDist);

obstacles = obstacles_from_grid(obstacleMask, startPoint,goalPoint, minDist);
% Initialize population - constrain control points to white path area
population = initializePopulation(nBees, nControlPoints, startPoint, goalPoint, pathMask);

% Main loop
for iter = 1:maxIter
    % Evaluate fitness
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    
    % Sort population by fitness
    [~, idx] = sort(fitness);
    population = population(idx, :);
    
    % Select elite and best sites
    eliteSites = population(1:nElite, :);
    bestSites = population(nElite+1:nElite+nBest, :);
    
    % Local search around elite sites
    for i = 1:nElite
        for j = 1:nEliteBees
            newBee = localSearch(eliteSites(i,:), 0.1, pathMask);
            population = [population; newBee];
        end
    end
    
    % Local search around best sites
    for i = 1:nBest
        for j = 1:nBestBees
            newBee = localSearch(bestSites(i,:), 0.2, pathMask);
            population = [population; newBee];
        end
    end
    
    % Random search for remaining bees
    nRemaining = nBees - (nElite * nEliteBees + nBest * nBestBees);
    for i = 1:nRemaining
        newBee = randomSearch(nControlPoints, startPoint, goalPoint, pathMask);
        population = [population; newBee];
    end
    
    % Keep only the best nBees
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    [~, idx] = sort(fitness);
    population = population(idx(1:nBees), :);
    
    % Plot and save current best solution
    % if mod(iter, 50) == 0
    %     figure('Visible', 'off');  % Create figure without displaying
    %     plotSolution(population(1,:), startPoint, goalPoint, obstacles);
    %     title(['Iteration: ', num2str(iter), '=> BestFitness = ', num2str(fitness(1))]);
    %     % Save figure
    %     saveas(gcf, fullfile(resultsDir, ['iteration_', num2str(iter, '%03d'), '.png']));
    %     close(gcf);
    % end
end

% Plot and save final solution
figure;%('Visible', 'off');
plotSolution(population(1,:), startPoint, goalPoint, obstacles);
title('Final Solution => BestFitness =', fitness(1));
% saveas(gcf, fullfile(resultsDir, 'final_solution.png'));
% close(gcf);

% Save best path
bestPath = reshape(population(1,:), 2, [])';
bestPath = [startPoint; bestPath; goalPoint];
% save(fullfile(resultsDir, 'best_path.mat'), 'bestPath');

% Create a video of the optimization process
% try
%     % Get all iteration images
%     imageFiles = dir(fullfile(resultsDir, 'iteration_*.png'));
%     imageFiles = {imageFiles.name};
% 
%     % Create video writer object
%     videoWriter = VideoWriter(fullfile(resultsDir, 'optimization_process.avi'));
%     videoWriter.FrameRate = 2;  % 2 frames per second
%     open(videoWriter);
    
    % Add each image to video
    % for i = 1:length(imageFiles)
    %     img = imread(fullfile(resultsDir, imageFiles{i}));
    %     writeVideo(videoWriter, img);
    % end
    % 
    % % Add final solution
    % img = imread(fullfile(resultsDir, 'final_solution.png'));
    % writeVideo(videoWriter, img);
    
    % Close video writer
%     close(videoWriter);
% catch
%     warning('Could not create video. Make sure you have the Image Processing Toolbox installed.');
% end

% Save run parameters
params = struct();
params.nBees = nBees;
params.nElite = nElite;
params.nBest = nBest;
params.nEliteBees = nEliteBees;
params.nBestBees = nBestBees;
params.maxIter = maxIter;
params.nControlPoints = nControlPoints;
params.startPoint = startPoint;
params.goalPoint = goalPoint;
params.nObstacles = nObstacles;
params.minDist = minDist;
%save(fullfile(resultsDir, 'parameters.mat'), 'params'); 
end