# Implement bat algorithm for robotic path planning
_Exported on 5/29/2025 at 16:46:12 GMT+1 from Cursor (0.50.7)_

---

**User**

Implement a Proof-of-Concept Model: help create a custom simulation where Bees Algorithm is applied to robotic trajectory optimization (e.g., 2D path planning with obstacle avoidance). in matlab

---

**Cursor**

I'll help you create a MATLAB implementation of the Bees Algorithm for robotic path planning with obstacle avoidance. Let's break this down into steps and create a comprehensive solution.

First, let's create the main files we'll need:

1. A main script to run the simulation
2. A function for the Bees Algorithm
3. A function for path evaluation
4. A function for obstacle visualization

Let me create these files:



```objective-c
% Main script for Bees Algorithm Path Planning
clear all;
close all;
clc;

% Parameters
nBees = 50;          % Number of bees
nElite = 5;          % Number of elite sites
nBest = 10;          % Number of best sites
nEliteBees = 10;     % Number of bees for elite sites
nBestBees = 5;       % Number of bees for best sites
maxIter = 100;       % Maximum iterations
nControlPoints = 5;  % Number of control points for path

% Environment setup
startPoint = [0, 0];
goalPoint = [10, 10];
obstacles = [3, 3, 1; 7, 7, 1; 5, 2, 1]; % [x, y, radius]

% Initialize population
population = initializePopulation(nBees, nControlPoints, startPoint, goalPoint);

% Main loop
for iter = 1:maxIter
    % Evaluate fitness
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    
    % Sort population by fitness
    [fitness, idx] = sort(fitness);
    population = population(idx, :);
    
    % Select elite and best sites
    eliteSites = population(1:nElite, :);
    bestSites = population(nElite+1:nElite+nBest, :);
    
    % Local search around elite sites
    for i = 1:nElite
        for j = 1:nEliteBees
            newBee = localSearch(eliteSites(i,:), 0.1);
            population = [population; newBee];
        end
    end
    
    % Local search around best sites
    for i = 1:nBest
        for j = 1:nBestBees
            newBee = localSearch(bestSites(i,:), 0.2);
            population = [population; newBee];
        end
    end
    
    % Random search for remaining bees
    nRemaining = nBees - (nElite * nEliteBees + nBest * nBestBees);
    for i = 1:nRemaining
        newBee = randomSearch(nControlPoints, startPoint, goalPoint);
        population = [population; newBee];
    end
    
    % Keep only the best nBees
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    [~, idx] = sort(fitness);
    population = population(idx(1:nBees), :);
    
    % Plot current best solution
    if mod(iter, 10) == 0
        plotSolution(population(1,:), startPoint, goalPoint, obstacles);
        title(['Iteration: ', num2str(iter)]);
        drawnow;
    end
end

% Plot final solution
plotSolution(population(1,:), startPoint, goalPoint, obstacles);
title('Final Solution');
```

Now, let's create the initialization function:


```objective-c
function population = initializePopulation(nBees, nControlPoints, startPoint, goalPoint)
    % Initialize population of bees with random paths
    % Each bee represents a path with nControlPoints control points
    
    % Calculate bounds for control points
    xMin = min(startPoint(1), goalPoint(1));
    xMax = max(startPoint(1), goalPoint(1));
    yMin = min(startPoint(2), goalPoint(2));
    yMax = max(startPoint(2), goalPoint(2));
    
    % Initialize population matrix
    % Each row represents one bee (path)
    % Each path has nControlPoints control points, each with x,y coordinates
    population = zeros(nBees, nControlPoints * 2);
    
    % Generate random paths for each bee
    for i = 1:nBees
        % Generate random control points
        for j = 1:nControlPoints
            population(i, 2*j-1) = xMin + (xMax-xMin)*rand(); % x coordinate
            population(i, 2*j) = yMin + (yMax-yMin)*rand();   % y coordinate
        end
    end
end
```

Now, let's create the fitness evaluation function:


```objective-c
function fitness = evaluateFitness(population, startPoint, goalPoint, obstacles)
    % Evaluate fitness of each path in the population
    % Lower fitness is better
    
    nBees = size(population, 1);
    fitness = zeros(nBees, 1);
    
    for i = 1:nBees
        % Extract control points for current path
        path = reshape(population(i,:), 2, [])';
        path = [startPoint; path; goalPoint];
        
        % Calculate path length
        pathLength = 0;
        for j = 1:size(path,1)-1
            pathLength = pathLength + norm(path(j+1,:) - path(j,:));
        end
        
        % Calculate obstacle penalty
        obstaclePenalty = 0;
        for j = 1:size(path,1)-1
            for k = 1:size(obstacles,1)
                % Calculate minimum distance from line segment to obstacle
                d = pointToLineDistance(path(j,:), path(j+1,:), obstacles(k,1:2));
                if d < obstacles(k,3)
                    obstaclePenalty = obstaclePenalty + (obstacles(k,3) - d)^2;
                end
            end
        end
        
        % Total fitness (path length + obstacle penalty)
        fitness(i) = pathLength + 100 * obstaclePenalty;
    end
end

function d = pointToLineDistance(p1, p2, point)
    % Calculate minimum distance from point to line segment
    v = p2 - p1;
    w = point - p1;
    
    % Project w onto v
    proj = dot(w,v) / dot(v,v);
    
    if proj < 0
        d = norm(point - p1);
    elseif proj > 1
        d = norm(point - p2);
    else
        d = norm(point - (p1 + proj * v));
    end
end
```

Now, let's create the local search function:


```objective-c
function newBee = localSearch(bee, radius)
    % Perform local search around a given solution
    % radius: search radius (smaller for elite sites, larger for best sites)
    
    % Add random perturbation to each control point
    newBee = bee;
    for i = 1:length(bee)
        newBee(i) = bee(i) + radius * (2*rand() - 1);
    end
end
```

Now, let's create the random search function:


```objective-c
function newBee = randomSearch(nControlPoints, startPoint, goalPoint)
    % Generate a completely new random solution
    
    % Calculate bounds for control points
    xMin = min(startPoint(1), goalPoint(1));
    xMax = max(startPoint(1), goalPoint(1));
    yMin = min(startPoint(2), goalPoint(2));
    yMax = max(startPoint(2), goalPoint(2));
    
    % Initialize new bee
    newBee = zeros(1, nControlPoints * 2);
    
    % Generate random control points
    for j = 1:nControlPoints
        newBee(2*j-1) = xMin + (xMax-xMin)*rand(); % x coordinate
        newBee(2*j) = yMin + (yMax-yMin)*rand();   % y coordinate
    end
end
```

Finally, let's create the visualization function:


```objective-c
function plotSolution(bee, startPoint, goalPoint, obstacles)
    % Plot the current best solution
    
    % Clear current figure
    clf;
    hold on;
    
    % Plot obstacles
    for i = 1:size(obstacles,1)
        circle(obstacles(i,1), obstacles(i,2), obstacles(i,3));
    end
    
    % Extract and plot path
    path = reshape(bee, 2, [])';
    path = [startPoint; path; goalPoint];
    plot(path(:,1), path(:,2), 'b-', 'LineWidth', 2);
    
    % Plot control points
    plot(path(:,1), path(:,2), 'ro', 'MarkerSize', 8);
    
    % Plot start and goal points
    plot(startPoint(1), startPoint(2), 'gs', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
    plot(goalPoint(1), goalPoint(2), 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    
    % Set axis limits and grid
    axis equal;
    grid on;
    xlabel('X');
    ylabel('Y');
end

function circle(x,y,r)
    % Draw a circle
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    fill(xunit, yunit, [0.8 0.8 0.8], 'EdgeColor', 'k');
end
```

I've created a complete MATLAB implementation of the Bees Algorithm for robotic path planning. Here's an explanation of the components:

1. `main.m`: The main script that:
   - Sets up the environment with start point, goal point, and obstacles
   - Initializes the bee population
   - Runs the main optimization loop
   - Visualizes the results

2. `initializePopulation.m`: Creates the initial population of bees, where each bee represents a path with control points.

3. `evaluateFitness.m`: Evaluates the quality of each path based on:
   - Path length
   - Obstacle avoidance (penalty for paths that intersect obstacles)

4. `localSearch.m`: Performs local search around promising solutions with different search radii for elite and best sites.

5. `randomSearch.m`: Generates completely new random solutions for exploration.

6. `plotSolution.m`: Visualizes the current best solution, including:
   - Obstacles (gray circles)
   - Path (blue line)
   - Control points (red circles)
   - Start point (green square)
   - Goal point (red square)

To run the simulation:

1. Save all these files in the same directory
2. Run `main.m` in MATLAB
3. The algorithm will run for 100 iterations, showing the best solution every 10 iterations
4. The final solution will be displayed at the end

The algorithm parameters can be adjusted in `main.m`:
- `nBees`: Total number of bees in the population
- `nElite`: Number of elite sites
- `nBest`: Number of best sites
- `nEliteBees`: Number of bees for elite sites
- `nBestBees`: Number of bees for best sites
- `maxIter`: Maximum number of iterations
- `nControlPoints`: Number of control points for each path

The environment can be modified by changing:
- `startPoint`: Starting position
- `goalPoint`: Goal position
- `obstacles`: Matrix of obstacles [x, y, radius]

The fitness function balances path length and obstacle avoidance. You can adjust the weight of the obstacle penalty (currently set to 100) in `evaluateFitness.m` to make the algorithm more or less sensitive to obstacles.

Would you like me to explain any specific part in more detail or make any adjustments to the implementation?

---

**User**

Can you run main.m from here?

---

**Cursor**

I'll help you run the main.m script. Let me execute it using the terminal:


I notice that the command didn't produce any output. This could be because:
1. MATLAB might not be installed on your system
2. MATLAB might not be in your system's PATH
3. The command syntax might need adjustment for your specific MATLAB installation

Let me try an alternative approach:


I see that MATLAB is not found in your system's PATH. To run the script, you'll need to:

1. Make sure MATLAB is installed on your system
2. Either:
   - Add MATLAB to your system's PATH, or
   - Run MATLAB directly from its installation directory

Could you please:
1. Confirm if MATLAB is installed on your system?
2. If it is installed, could you provide the path to your MATLAB installation? (It's typically something like `C:\Program Files\MATLAB\R20XX\bin\matlab.exe`)

Once you provide this information, I can help you run the script with the correct path to MATLAB.

---

**User**

1. Yes
2. C:\Program Files\MATLAB\R2024a\bin\matlab.exe

---

**Cursor**

Thank you for providing the MATLAB path. Let me run the script using the full path to MATLAB:


I see there's an issue with the PowerShell command syntax. Let me modify the command to work with PowerShell:


The script should now be running. You should see:
1. A MATLAB figure window showing the path planning visualization
2. The visualization will update every 10 iterations
3. The final solution will be displayed at the end

If you're not seeing the visualization window, it might be because:
1. The script is running in the background
2. There might be an issue with the display settings

Would you like me to:
1. Try a different command to run MATLAB?
2. Modify the script to ensure the visualization is more visible?
3. Check if there are any errors in the execution?

Please let me know what you're seeing (or not seeing) and I'll help adjust accordingly.

---

**User**

I saw the visualization, can you randomize the location of the obstacles?

---

**Cursor**

I'll modify the main.m file to randomize the obstacle locations while keeping them within reasonable bounds of the environment:


```objective-c
% Main script for Bees Algorithm Path Planning
clear all;
close all;
clc;

% Parameters
nBees = 50;          % Number of bees
nElite = 5;          % Number of elite sites
nBest = 10;          % Number of best sites
nEliteBees = 10;     % Number of bees for elite sites
nBestBees = 5;       % Number of bees for best sites
maxIter = 100;       % Maximum iterations
nControlPoints = 5;  % Number of control points for path

% Environment setup
startPoint = [0, 0];
goalPoint = [10, 10];

% Generate random obstacles
nObstacles = 5;  % Number of obstacles
obstacles = zeros(nObstacles, 3);  % [x, y, radius]

% Keep obstacles away from start and goal points
minDist = 1.5;  % Minimum distance from start/goal points
for i = 1:nObstacles
    while true
        % Generate random position
        x = 1 + 8 * rand();  % Keep within 1-9 range
        y = 1 + 8 * rand();  % Keep within 1-9 range
        r = 0.5 + 0.5 * rand();  % Random radius between 0.5 and 1
        
        % Check distance from start and goal points
        distToStart = norm([x,y] - startPoint);
        distToGoal = norm([x,y] - goalPoint);
        
        if distToStart > minDist && distToGoal > minDist
            obstacles(i,:) = [x, y, r];
            break;
        end
    end
end

% Initialize population
population = initializePopulation(nBees, nControlPoints, startPoint, goalPoint);

% Main loop
for iter = 1:maxIter
    % Evaluate fitness
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    
    % Sort population by fitness
    [fitness, idx] = sort(fitness);
    population = population(idx, :);
    
    % Select elite and best sites
    eliteSites = population(1:nElite, :);
    bestSites = population(nElite+1:nElite+nBest, :);
    
    % Local search around elite sites
    for i = 1:nElite
        for j = 1:nEliteBees
            newBee = localSearch(eliteSites(i,:), 0.1);
            population = [population; newBee];
        end
    end
    
    % Local search around best sites
    for i = 1:nBest
        for j = 1:nBestBees
            newBee = localSearch(bestSites(i,:), 0.2);
            population = [population; newBee];
        end
    end
    
    % Random search for remaining bees
    nRemaining = nBees - (nElite * nEliteBees + nBest * nBestBees);
    for i = 1:nRemaining
        newBee = randomSearch(nControlPoints, startPoint, goalPoint);
        population = [population; newBee];
    end
    
    % Keep only the best nBees
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    [~, idx] = sort(fitness);
    population = population(idx(1:nBees), :);
    
    % Plot current best solution
    if mod(iter, 10) == 0
        plotSolution(population(1,:), startPoint, goalPoint, obstacles);
        title(['Iteration: ', num2str(iter)]);
        drawnow;
    end
end

% Plot final solution
plotSolution(population(1,:), startPoint, goalPoint, obstacles);
title('Final Solution');
```

I've modified the main.m file to:
1. Generate 5 random obstacles
2. Place obstacles randomly within the environment (between 1 and 9 in both x and y coordinates)
3. Give each obstacle a random radius between 0.5 and 1
4. Ensure obstacles are not too close to the start and goal points (minimum distance of 1.5 units)

Let's run the modified script:


The script should now be running with random obstacles. Each time you run the script, you'll get a different obstacle configuration. The Bees Algorithm will then try to find the optimal path around these randomly placed obstacles.

You can adjust the following parameters in the code to modify the obstacle generation:
- `nObstacles`: Change the number of obstacles
- `minDist`: Adjust the minimum distance from start/goal points
- The range of x and y coordinates (currently 1-9)
- The range of obstacle radii (currently 0.5-1)

Would you like to make any adjustments to these parameters or try a different configuration?

---

**User**

Can the figures be saved? 

---

**Cursor**

Yes, I'll modify the main.m file to save the figures at key iterations and the final solution:


```objective-c
% Main script for Bees Algorithm Path Planning
clear all;
close all;
clc;

% Create results directory if it doesn't exist
if ~exist('results', 'dir')
    mkdir('results');
end

% Parameters
nBees = 50;          % Number of bees
nElite = 5;          % Number of elite sites
nBest = 10;          % Number of best sites
nEliteBees = 10;     % Number of bees for elite sites
nBestBees = 5;       % Number of bees for best sites
maxIter = 100;       % Maximum iterations
nControlPoints = 5;  % Number of control points for path

% Environment setup
startPoint = [0, 0];
goalPoint = [10, 10];

% Generate random obstacles
nObstacles = 5;  % Number of obstacles
obstacles = zeros(nObstacles, 3);  % [x, y, radius]

% Keep obstacles away from start and goal points
minDist = 1.5;  % Minimum distance from start/goal points
for i = 1:nObstacles
    while true
        % Generate random position
        x = 1 + 8 * rand();  % Keep within 1-9 range
        y = 1 + 8 * rand();  % Keep within 1-9 range
        r = 0.5 + 0.5 * rand();  % Random radius between 0.5 and 1
        
        % Check distance from start and goal points
        distToStart = norm([x,y] - startPoint);
        distToGoal = norm([x,y] - goalPoint);
        
        if distToStart > minDist && distToGoal > minDist
            obstacles(i,:) = [x, y, r];
            break;
        end
    end
end

% Save obstacle configuration
save('results/obstacles.mat', 'obstacles');

% Initialize population
population = initializePopulation(nBees, nControlPoints, startPoint, goalPoint);

% Main loop
for iter = 1:maxIter
    % Evaluate fitness
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    
    % Sort population by fitness
    [fitness, idx] = sort(fitness);
    population = population(idx, :);
    
    % Select elite and best sites
    eliteSites = population(1:nElite, :);
    bestSites = population(nElite+1:nElite+nBest, :);
    
    % Local search around elite sites
    for i = 1:nElite
        for j = 1:nEliteBees
            newBee = localSearch(eliteSites(i,:), 0.1);
            population = [population; newBee];
        end
    end
    
    % Local search around best sites
    for i = 1:nBest
        for j = 1:nBestBees
            newBee = localSearch(bestSites(i,:), 0.2);
            population = [population; newBee];
        end
    end
    
    % Random search for remaining bees
    nRemaining = nBees - (nElite * nEliteBees + nBest * nBestBees);
    for i = 1:nRemaining
        newBee = randomSearch(nControlPoints, startPoint, goalPoint);
        population = [population; newBee];
    end
    
    % Keep only the best nBees
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    [~, idx] = sort(fitness);
    population = population(idx(1:nBees), :);
    
    % Plot and save current best solution
    if mod(iter, 10) == 0
        figure('Visible', 'off');  % Create figure without displaying
        plotSolution(population(1,:), startPoint, goalPoint, obstacles);
        title(['Iteration: ', num2str(iter)]);
        % Save figure
        saveas(gcf, ['results/iteration_', num2str(iter, '%03d'), '.png']);
        close(gcf);
    end
end

% Plot and save final solution
figure('Visible', 'off');
plotSolution(population(1,:), startPoint, goalPoint, obstacles);
title('Final Solution');
saveas(gcf, 'results/final_solution.png');
close(gcf);

% Save best path
bestPath = reshape(population(1,:), 2, [])';
bestPath = [startPoint; bestPath; goalPoint];
save('results/best_path.mat', 'bestPath');

% Create a video of the optimization process
try
    % Get all iteration images
    imageFiles = dir('results/iteration_*.png');
    imageFiles = {imageFiles.name};
    
    % Create video writer object
    videoWriter = VideoWriter('results/optimization_process.avi');
    videoWriter.FrameRate = 2;  % 2 frames per second
    open(videoWriter);
    
    % Add each image to video
    for i = 1:length(imageFiles)
        img = imread(['results/', imageFiles{i}]);
        writeVideo(videoWriter, img);
    end
    
    % Add final solution
    img = imread('results/final_solution.png');
    writeVideo(videoWriter, img);
    
    % Close video writer
    close(videoWriter);
catch
    warning('Could not create video. Make sure you have the Image Processing Toolbox installed.');
end
```

I've modified the script to:

1. Create a 'results' directory to store all outputs
2. Save the following files:
   - `obstacles.mat`: The obstacle configuration
   - `iteration_XXX.png`: Images of the path at every 10th iteration
   - `final_solution.png`: The final optimized path
   - `best_path.mat`: The coordinates of the best path found
   - `optimization_process.avi`: A video showing the optimization process (if Image Processing Toolbox is available)

Let's run the modified script:


The script has successfully created all the output files in the 'results' directory:

1. `obstacles.mat`: Contains the random obstacle configuration
2. `iteration_XXX.png`: Images showing the path evolution every 10 iterations
3. `final_solution.png`: The final optimized path
4. `best_path.mat`: The coordinates of the best path found
5. `optimization_process.avi`: A video showing the optimization process

You can:
1. View the individual PNG files to see how the path evolved
2. Play the AVI file to see a smooth animation of the optimization process
3. Load `best_path.mat` in MATLAB to analyze the final path coordinates
4. Load `obstacles.mat` to see the exact obstacle configuration

Would you like to:
1. Modify the saving frequency (currently every 10 iterations)?
2. Change the video frame rate (currently 2 fps)?
3. Add any additional data to save?
4. View any specific output file?

---

**User**

Can you save the files in a new folder every run. The folder should be named "Test_results_run_at_{Timestamp}"

---

**Cursor**

I'll modify the main.m file to create a timestamped folder for each run:


```objective-c
% Main script for Bees Algorithm Path Planning
clear all;
close all;
clc;

% Create timestamped results directory
timestamp = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
resultsDir = ['Test_results_run_at_', timestamp];
if ~exist(resultsDir, 'dir')
    mkdir(resultsDir);
end

% Parameters
nBees = 50;          % Number of bees
nElite = 5;          % Number of elite sites
nBest = 10;          % Number of best sites
nEliteBees = 10;     % Number of bees for elite sites
nBestBees = 5;       % Number of bees for best sites
maxIter = 100;       % Maximum iterations
nControlPoints = 5;  % Number of control points for path

% Environment setup
startPoint = [0, 0];
goalPoint = [10, 10];

% Generate random obstacles
nObstacles = 5;  % Number of obstacles
obstacles = zeros(nObstacles, 3);  % [x, y, radius]

% Keep obstacles away from start and goal points
minDist = 1.5;  % Minimum distance from start/goal points
for i = 1:nObstacles
    while true
        % Generate random position
        x = 1 + 8 * rand();  % Keep within 1-9 range
        y = 1 + 8 * rand();  % Keep within 1-9 range
        r = 0.5 + 0.5 * rand();  % Random radius between 0.5 and 1
        
        % Check distance from start and goal points
        distToStart = norm([x,y] - startPoint);
        distToGoal = norm([x,y] - goalPoint);
        
        if distToStart > minDist && distToGoal > minDist
            obstacles(i,:) = [x, y, r];
            break;
        end
    end
end

% Save obstacle configuration
save(fullfile(resultsDir, 'obstacles.mat'), 'obstacles');

% Initialize population
population = initializePopulation(nBees, nControlPoints, startPoint, goalPoint);

% Main loop
for iter = 1:maxIter
    % Evaluate fitness
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    
    % Sort population by fitness
    [fitness, idx] = sort(fitness);
    population = population(idx, :);
    
    % Select elite and best sites
    eliteSites = population(1:nElite, :);
    bestSites = population(nElite+1:nElite+nBest, :);
    
    % Local search around elite sites
    for i = 1:nElite
        for j = 1:nEliteBees
            newBee = localSearch(eliteSites(i,:), 0.1);
            population = [population; newBee];
        end
    end
    
    % Local search around best sites
    for i = 1:nBest
        for j = 1:nBestBees
            newBee = localSearch(bestSites(i,:), 0.2);
            population = [population; newBee];
        end
    end
    
    % Random search for remaining bees
    nRemaining = nBees - (nElite * nEliteBees + nBest * nBestBees);
    for i = 1:nRemaining
        newBee = randomSearch(nControlPoints, startPoint, goalPoint);
        population = [population; newBee];
    end
    
    % Keep only the best nBees
    fitness = evaluateFitness(population, startPoint, goalPoint, obstacles);
    [~, idx] = sort(fitness);
    population = population(idx(1:nBees), :);
    
    % Plot and save current best solution
    if mod(iter, 10) == 0
        figure('Visible', 'off');  % Create figure without displaying
        plotSolution(population(1,:), startPoint, goalPoint, obstacles);
        title(['Iteration: ', num2str(iter)]);
        % Save figure
        saveas(gcf, fullfile(resultsDir, ['iteration_', num2str(iter, '%03d'), '.png']));
        close(gcf);
    end
end

% Plot and save final solution
figure('Visible', 'off');
plotSolution(population(1,:), startPoint, goalPoint, obstacles);
title('Final Solution');
saveas(gcf, fullfile(resultsDir, 'final_solution.png'));
close(gcf);

% Save best path
bestPath = reshape(population(1,:), 2, [])';
bestPath = [startPoint; bestPath; goalPoint];
save(fullfile(resultsDir, 'best_path.mat'), 'bestPath');

% Create a video of the optimization process
try
    % Get all iteration images
    imageFiles = dir(fullfile(resultsDir, 'iteration_*.png'));
    imageFiles = {imageFiles.name};
    
    % Create video writer object
    videoWriter = VideoWriter(fullfile(resultsDir, 'optimization_process.avi'));
    videoWriter.FrameRate = 2;  % 2 frames per second
    open(videoWriter);
    
    % Add each image to video
    for i = 1:length(imageFiles)
        img = imread(fullfile(resultsDir, imageFiles{i}));
        writeVideo(videoWriter, img);
    end
    
    % Add final solution
    img = imread(fullfile(resultsDir, 'final_solution.png'));
    writeVideo(videoWriter, img);
    
    % Close video writer
    close(videoWriter);
catch
    warning('Could not create video. Make sure you have the Image Processing Toolbox installed.');
end

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
save(fullfile(resultsDir, 'parameters.mat'), 'params');
```

I've made the following changes to the script:

1. Added timestamp-based folder creation:
   - Uses MATLAB's `datestr` function to create a timestamp in the format 'yyyy-mm-dd_HH-MM-SS'
   - Creates a folder named 'Test_results_run_at_[timestamp]' for each run

2. Updated all file paths to use the new timestamped directory:
   - Used `fullfile` function for better cross-platform compatibility
   - All files are now saved in the timestamped directory

3. Added a new feature to save run parameters:
   - Creates a `parameters.mat` file containing all the important parameters used in the run
   - This makes it easier to track and reproduce results

Let's run the modified script:


---

**User**

run main.m

---

**Cursor**

I'll run the main.m script again:


Let's check the newly created timestamped directory:


Let me check the most recent timestamped directory:


Let's check the contents of the most recent results directory:


The script has successfully run and created a new timestamped directory with all the output files:

1. `parameters.mat`: Contains all the parameters used in this run
2. `obstacles.mat`: The random obstacle configuration
3. `iteration_XXX.png`: Images showing the path evolution every 10 iterations
4. `final_solution.png`: The final optimized path
5. `best_path.mat`: The coordinates of the best path found
6. `optimization_process.avi`: A video showing the optimization process

Each time you run the script, it will create a new directory with a unique timestamp, making it easy to:
1. Keep track of different runs
2. Compare results from different parameter settings
3. Maintain a history of experiments

Would you like to:
1. View any specific output file?
2. Make any adjustments to the parameters?
3. Run another test with different settings?

---

**User**

Is the obstacle position randomised?

---

**Cursor**

Yes, the obstacle positions are randomized in the code. Let me show you the relevant part from main.m:

```matlab
% Generate random obstacles
nObstacles = 5;  % Number of obstacles
obstacles = zeros(nObstacles, 3);  % [x, y, radius]

% Keep obstacles away from start and goal points
minDist = 1.5;  % Minimum distance from start/goal points
for i = 1:nObstacles
    while true
        % Generate random position
        x = 1 + 8 * rand();  % Keep within 1-9 range
        y = 1 + 8 * rand();  % Keep within 1-9 range
        r = 0.5 + 0.5 * rand();  % Random radius between 0.5 and 1
        
        % Check distance from start and goal points
        distToStart = norm([x,y] - startPoint);
        distToGoal = norm([x,y] - goalPoint);
        
        if distToStart > minDist && distToGoal > minDist
            obstacles(i,:) = [x, y, r];
            break;
        end
    end
end
```

For each run:
1. 5 obstacles are generated (`nObstacles = 5`)
2. Each obstacle has:
   - Random x position between 1 and 9 (`x = 1 + 8 * rand()`)
   - Random y position between 1 and 9 (`y = 1 + 8 * rand()`)
   - Random radius between 0.5 and 1 (`r = 0.5 + 0.5 * rand()`)
3. Obstacles are kept at least 1.5 units away from both start point (0,0) and goal point (10,10)

Let's verify this by running the script twice and comparing the obstacle positions:


```plaintext
% Generate random obstacles
nObstacles = 5;  % Number of obstacles
obstacles = zeros(nObstacles, 3);  % [x, y, radius]

% Keep obstacles away from start and goal points
minDist = 1.5;  % Minimum distance from start/goal points
for i = 1:nObstacles
    while true
        % Generate random position
        x = 1 + 8 * rand();  % Keep within 1-9 range
        y = 1 + 8 * rand();  % Keep within 1-9 range
        r = 0.5 + 0.5 * rand();  % Random radius between 0.5 and 1
        
        % Check distance from start and goal points
        distToStart = norm([x,y] - startPoint);
        distToGoal = norm([x,y] - goalPoint);
        
        if distToStart > minDist && distToGoal > minDist
            obstacles(i,:) = [x, y, r];
            break;
        end
    end
end
```

Let's check the most recent two runs to compare their obstacle positions:


