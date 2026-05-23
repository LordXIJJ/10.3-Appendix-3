%% QBA1 Benchmark Runner
clc;
clear;
close all;

% Test Functions
functions = {'F1', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12',...
   'F13', 'F14', 'F15', 'F16', 'F17', 'F18', 'F19', 'F20', 'F21', 'F22', 'F23',...
   'F24', 'F25', 'F26', 'F27', 'F28', 'F29', 'F30'};
nFuncs = numel(functions);
nRuns = 30;  % Number of independent runs

% Algorithm Parameters
MaxIt = 5000;

% Initialize Results Structure
for i = 1:nFuncs
    for j = 1:nRuns
        Initial_Results.(functions{i})(j).BestPos = [];
        Initial_Results.(functions{i})(j).BestCost = [];
        Initial_Results.(functions{i})(j).BestCosts = [];
        % Initial_Results.(functions{i})(j).ExecutionTime = [];
        % Initial_Results.(functions{i})(j).FitEvals = [];
        Initial_Results.(functions{i})(j).Dimension = [];
    end
end

% Run Tests
for func = 1:nFuncs
    fprintf('\nTesting Function: %s\n', functions{func});
    fprintf('----------------------------------------\n');
    
    % Get Function Details
    %[LB, UB, nVar, CostFunction] = Function_Library(functions{func});
    [LB,UB,nVar,CostFunction] = CEC2017(functions{func});
    
    % Perform multiple runs
    for run = 1:nRuns
        fprintf('\nRun %d/%d:\n', run, nRuns);
        
        % Run Algorithm
        %[BestPos, BestCosts, ExecutionTime, FitEvals] = QBA1_main_not_in_use(CostFunction, nVar, LB, UB, MaxIt);
        
        [BestCost,BestPos,BestCosts]=GJO(100,MaxIt,LB,UB,nVar,CostFunction);
        % Store Results for this run
        Initial_Results.(functions{func})(run).BestPos = BestPos;
        Initial_Results.(functions{func})(run).BestCost = BestCost;
        Initial_Results.(functions{func})(run).BestCosts = BestCosts;
        %Initial_Results.(functions{func})(run).ExecutionTime = ExecutionTime;
        % Initial_Results.(functions{func})(run).FitEvals = FitEvals;
        Initial_Results.(functions{func})(run).Dimension = nVar;
        
        % Display Run Results
        fprintf('Best Cost: %.4e   ', ...
            BestCost);
    end
    
    % Calculate and display statistics for this function
    costs = zeros(1, nRuns);
    %times = zeros(1, nRuns);
    %evals = zeros(1, nRuns);
    for r = 1:nRuns
        costs(r) = Initial_Results.(functions{func})(r).BestCost;
        % times(r) = Initial_Results.(functions{func})(r).ExecutionTime;
        %evals(r) = Initial_Results.(functions{func})(r).FitEvals;
    end
    
    fprintf('\nStatistics for %s:\n', functions{func});
    fprintf('\nBest Cost - Mean: %.4e, Std: %.4e\n', mean(costs), std(costs));
    % fprintf('Time     - Mean: %.2f s, Std: %.2f s\n', mean(times), std(times));
    %fprintf('FitEvals - Mean: %.2f, Std: %.2f\n', mean(evals), std(evals));
    fprintf('----------------------------------------\n');
    % Save Results
    save('GJO_CEC2017_30runs_100D_100SA_5000It.mat', 'Initial_Results');
end

% % Save Results
% save('QBA1_Results_50runs.mat', 'Initial_Results');

% Display Final Summary Table
fprintf('\nFinal Summary (Averaged over %d runs):\n', nRuns);
fprintf('----------------------------------------\n');
fprintf('\nFunction\tDim\tMean Cost\tStd Cost\t');
fprintf('----------------------------------------\n');
for func = 1:nFuncs
    costs = zeros(1, nRuns);
    % times = zeros(1, nRuns);
    % evals = zeros(1, nRuns);
    for r = 1:nRuns
        costs(r) = Initial_Results.(functions{func})(r).BestCost;
        % times(r) = Initial_Results.(functions{func})(r).ExecutionTime;
        % evals(r) = Initial_Results.(functions{func})(r).FitEvals;
    end
    
    fprintf('\n%s\t\t%d\t%.4e\t%.4e\t%.2f\t\t%.2f\n\n', ...
        functions{func}, ...
        Initial_Results.(functions{func})(1).Dimension, ...
        mean(costs), ...
        std(costs));
end
fprintf('\n----------------------------------------\n'); 