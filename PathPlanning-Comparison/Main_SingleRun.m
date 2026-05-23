%% Main File to Run Path Planning

clc;
clear;
close all;

%% Obstacle Generation & Parameters
nObstacles = 9;
obstacles = zeros(nObstacles,3);
x = [1.5   5       4   7       1.2     6       7       7       8]; % X-axis
y = [4.5   6       3   1       1.5     2.5     4       8       6]; % Y-axis
r = [1.5   0.8     1   0.8     0.8     0.5     0.8     0.8     0.8]; % Radius

obstacles(:,1) = x';
obstacles(:,2) = y';
obstacles(:,3) = r';
% Path planning parameters
nControlPoints = 5;
startPoint = [0, 0];
goalPoint = [10, 10];

% Bounds for control points
xMin = min(startPoint(1), goalPoint(1));
xMax = max(startPoint(1), goalPoint(1));
yMin = min(startPoint(2), goalPoint(2));
yMax = max(startPoint(2), goalPoint(2));

lb = repmat([xMin, yMin], 1, nControlPoints);
ub = repmat([xMax, yMax], 1, nControlPoints);
dim = 2 * nControlPoints;

%% Metaheuristic Parameters

SearchAgents_no = 100;
MaxIt = 100;

fobj = @(x) Evaluate_Fitness(x, startPoint, goalPoint, obstacles);
n = 10; m = 5; e = 2; nep = 25; nsp = 15; ngh = 0.5; ColonySize = (e*nep)+((m-e)*nsp)+n-m; % BBA Parameters
%% Run Metaheuristic
for ind_run = 1:30
tic
[bestScore, bestPos, convergenceCurve] = BBA(n, m, e, nep, nsp, ngh, MaxIt, lb, ub, dim, fobj);
% [bestScore, bestPos, convergenceCurve] = Function_BA1(SearchAgents_no, MaxIt, lb,ub,dim,fobj);
% [bestScore, bestPos, convergenceCurve] = GJO(SearchAgents_no, MaxIt, lb, ub, dim, fobj);
% [bestScore, bestPos, convergenceCurve] = GWO(SearchAgents_no, MaxIt, lb, ub, dim, fobj);
% [bestScore, bestPos, convergenceCurve] = NRBO(SearchAgents_no, MaxIt, lb, ub, dim, fobj);
% [bestScore, bestPos, convergenceCurve] = WOA(SearchAgents_no, MaxIt, lb, ub, dim, fobj);
% [bestScore, bestPos, convergenceCurve] = SCA(SearchAgents_no, MaxIt, lb, ub, dim, fobj);
TimePassed=toc;
Results(ind_run).BestPathLength = bestScore;
Results(ind_run).BestCPs = bestPos;
Results(ind_run).convCurve = convergenceCurve;
Results(ind_run).Time = TimePassed;
end
% Plot and save final solution
% figure();
% plotBestPath(bestPos, startPoint, goalPoint, obstacles);
% title(['Final Solution => BestFitness = ', num2str(bestScore)]);

% Save best path and run info
% bestPath = reshape(bestPos, 2, [])';
% bestPath = [startPoint; bestPath; goalPoint];