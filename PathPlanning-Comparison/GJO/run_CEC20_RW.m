%% QBA1 Runner
clc;
clear;
close all;


sel_function = 33;
nRuns = 30;  % Number of independent runs
% Algorithm Parameters
MaxIt = 1000;

[LB,UB,nVar,CostFunction] = CEC2020(sel_function);
    
    for run = 1:nRuns
        fprintf('Run %d/%d:\n', run, nRuns);
        
        % Run Algorithm
        %[Results(run).BestSol, Results(run).BestCosts, Results(run).ExecutionTime, Results(run).FitEvals] = QBA1_main_CEC2020_RW(CostFunction, nVar, LB, UB, MaxIt);
        [Results(run).BestCost,Results(run).BestPos,Results(run).BestCosts]=GJO(100,MaxIt,LB,UB,nVar,CostFunction);
        
        % Display Run Results
        fprintf('Best Cost: %.4e ', ...
            Results(run).BestCost);
    end
save GJO_CEC2020_RW_1000It_30runs_F33.mat Results