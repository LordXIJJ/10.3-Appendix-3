function [retCost, retPos, OptCost] = BBA(n, m, e, nep, nsp, ngh, MaxIt, VarMin, VarMax, Dims, ObjFunction)

%% Problem Definition


% Dims = Instance.dim;
% ObjFunction = @(x) Instance.evaluation( x ); % Objective Function
VarSize = [1 Dims]; % Decision Variables Matrix Size
%VarMin = Instance.lowerBoundaries; % Decision Variables Lower Bound
%VarMax = Instance.upperBoundaries; % Decision Variables Upper Bound
range = VarMax-VarMin;

%% Bees Algorithm Parameters
%n = 10; m = 5; e = 2; nep = 20; nsp = 10; ngh = 0.1;

% MaxEval = 1000000000;
%MaxIt = 3000;

%% Initialization
Unknown_Patch.Position = [];
Unknown_Patch.Cost = [];
Unknown_Patch.counter = [];
Scout = repmat(Unknown_Patch,n,1);
counter = 0;
% Generate Initial Solutions
for i = 1:n
    Scout(i).Position = unifrnd(VarMin,VarMax,VarSize);
    Scout(i).Cost = ObjFunction(Scout(i).Position);
    counter = counter+1;
    Scout(i).counter = counter;
end

%% Sites Selection 
[~, RankOrder] = sort([Scout.Cost]);
Patch = Scout(RankOrder);
BestSol.Cost = inf;

%% Bees Algorithm Local and Global Search
for it = 1:MaxIt
    % if counter >= MaxEval
    %     break;
    % end
    % Lokal Search elite
    for i = 1:e
        bestWorker.Cost = inf;
        for j = 1:nep
            Worker.Position = ForagingBBA (Patch(i).Position,ngh,VarMax,VarMin);
            Worker.Cost = ObjFunction(Worker.Position);
            counter = counter+1;
            Worker.counter = counter;
            if Worker.Cost < bestWorker.Cost
                bestWorker = Worker;
            end
        end
        if bestWorker.Cost < Patch(i).Cost
            Patch(i) = bestWorker;
        end
    end
    % Lokal Search non-elite
    for i = e+1:m
        bestWorker.Cost = inf;
        for j = 1:nsp
            Worker.Position = ForagingBBA (Patch(i).Position,ngh,VarMax,VarMin);
            Worker.Cost = ObjFunction(Worker.Position);
            counter = counter+1;
            Worker.counter = counter;
            if Worker.Cost < bestWorker.Cost
                bestWorker = Worker;
            end
        end
        if bestWorker.Cost < Patch(i).Cost
            Patch(i) = bestWorker;
        end
    end
    % Global Search
    for i = m+1:n
        Patch(i).Position = unifrnd(VarMin,VarMax,VarSize);
        Patch(i).Cost = ObjFunction(Patch(i).Position);
        counter = counter+1;
        Patch(i).counter = counter;
    end
    % SORTING
    [~, RankOrder] = sort([Patch.Cost]);
    Patch = Patch(RankOrder);
    % Update Best Solution Ever Found
    OptSol = Patch(1);
    if OptSol.Cost < BestSol.Cost
        BestSol = OptSol;
    end
    % taking of result
    OptCost(it) = BestSol.Cost;
    Counter(it) = counter;
    retCost=BestSol.Cost;
    retPos=BestSol.Position;
    % Display Iteration Information
    % disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(OptCost(it)) ' --> Time = ' num2str(Time(it)) ' seconds' '; Fittness Evaluations = ' num2str(Counter(it))]);
    % if(abs(Instance.optima-BestSol.Cost) <= accuracy) 
    %     break;
    % end
end
end