%% Industrial Chemical Processes		
 % 1) Heat Exchanger Network Design (case 1)
 % 2) Heat Exchanger Network Design (case 2)
 % 3) Optimal Operation of Alkylation Unit
 % 4) Reactor Network Design (RND)
 % 5) Haverly's Pooling Problem
 % 6) Blending-Pooling-Separation problem
 % 7) Propane, Isobutane, n-Butane Nonsharp Separation

%% Process Synthesis and Design Problems		
 % 8) Process synthesis problem
 % 9) Process synthesis and design problem
 % 10) Process flow sheeting problem
 % 11) Two-reactor Problem
 % 12) Process synthesis problem
 % 13) Process design Problem
 % 14) Multi-product batch plant

%% Mechanical Engineering Problem		
 % 15) Weight Minimization of a Speed Reducer
 % 16) Optimal Design of Industrial refrigeration System
 % 17) Tension/compression  spring  design (case 1)
 % 18) Pressure vessel design
 % 19) Welded beam design
 % 20) Three-bar truss design problem
 % 21) Multiple disk clutch brake design problem
 % 22) Planetary gear train design optimization problem
 % 23) Step-cone pulley problem
 % 24) Robot gripper problem
 % 25) Hydro-static thrust bearing design problem
 % 26) Four-stage gear box problem
 % 27) 10-bar truss design
 % 28) Rolling element bearing
 % 29) Gas Transmission Compressor Design (GTCD)
 % 30) Tension/compression  spring  design (case 2)
 % 31) Gear train  design Problem
 % 32) Himmelblau's Function
 % 33) Topology Optimization

%% Power System Problems		
 % 34) Optimal Sizing of Single Phase Distributed Generation with reactive power support for Phase Balancing at Main Transformer/Grid
 % 35) Optimal Sizing of Distributed Generation for Active Power Loss Minimization
 % 36) Optimal Sizing of Distributed Generation (DG) and Capacitors for Reactive Power Loss Minimization
 % 37) Optimal Power flow (Minimization of Active Power Loss)
 % 38) Optimal Power flow (Minimization of Fuel Cost)
 % 39) Optimal Power flow (Minimization of Active Power Loss and Fuel Cost)
 % 40) Microgrid Power flow (Islanded case)
 % 41) Microgrid Power flow (Grid-connected case)
 % 42) Optimal Setting of Droop Controller for Minimization of Active Power Loss in Islanded Microgrids
 % 43) Optimal Setting of Droop Controller for Minimization of  Reactive Power Loss in Islanded Microgrids
 % 44) Wind Farm Layout Problem

%% Power Electronic Problems		
 % 45) SOPWM for 3-level Invereters
 % 46) SOPWM for 5-level Inverters
 % 47) SOPWM for 7-level Inverters
 % 48) SOPWM for 9-level Inverters
 % 49) SOPWM for 11-level Inverters
 % 50) SOPWM for 13-level Inverters

%% Livestock Feed Ration Optimization 		
 % 51) Livestock Feed Ration Optimization (case 1)
 % 52) Livestock Feed Ration Optimization (case 2)
 % 53) Livestock Feed Ration Optimization (case 3)
 % 54) Livestock Feed Ration Optimization (case 4)
 % 55) Livestock Feed Ration Optimization (case 5)
 % 56) Livestock Feed Ration Optimization (case 6)
 % 57) Livestock Feed Ration Optimization (case 7)



function [lb,ub,dim,fobj] = CEC2020(F)

global initial_flag
initial_flag = 0;
Par     = Cal_par(F);
switch F
    %CEC2020 - RW - 1
    case 1
        fobj = @F1;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 2
    case 2
        fobj = @F2;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 3
    case 3
        fobj = @F3;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 4
    case 4
        fobj = @F4;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 5
    case 5
        fobj = @F5;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 6
    case 6
        fobj = @F6;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 7
    case 7
        fobj = @F7;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 8
    case 8
        fobj = @F8;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 9
    case 9
        fobj = @F9;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 10
    case 10
        fobj = @F10;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 11
    case 11
        fobj = @F11;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 12
    case 12
        fobj = @F12;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 13
    case 13
        fobj = @F13;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 14
    case 14
        fobj = @F14;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 15
    case 15
        fobj = @F15;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    
    %CEC2020 - RW - 16
    case 16
        fobj = @F16;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 17
    case 17
        fobj = @F17;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 18
    case 18
        fobj = @F18;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 19
    case 19
        fobj = @F19;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 20
    case 20
        fobj = @F20;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 21
    case 21
        fobj = @F21;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 22
    case 22
        fobj = @F22;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 23
    case 23
        fobj = @F23;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 24
    case 24
        fobj = @F24;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 25
    case 25
        fobj = @F25;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 26
    case 26
        fobj = @F26;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 27
    case 27
        fobj = @F27;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 28
    case 28
        fobj = @F28;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 29
    case 29
        fobj = @F29;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 30
    case 30
        fobj = @F30;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 31
    case 31
        fobj = @F31;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    
    %CEC2020 - RW - 32
    case 32
        fobj = @F32;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 33
    case 33
        fobj = @F33;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 34
    case 34
        fobj = @F34;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 35
    case 35
        fobj = @F35;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 36
    case 36
        fobj = @F36;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 37
    case 37
        fobj = @F37;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 38
    case 38
        fobj = @F38;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 39
    case 39
        fobj = @F39;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 40
    case 40
        fobj = @F40;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 41
    case 41
        fobj = @F41;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
    %CEC2020 - RW - 42
    case 42
        fobj = @F42;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
            %CEC2020 - RW - 43
    case 43
        fobj = @F43;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
            %CEC2020 - RW - 44
    case 44
        fobj = @F44;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
            %CEC2020 - RW - 45
    case 45
        fobj = @F45;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
            %CEC2020 - RW - 46
    case 46
        fobj = @F46;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
            %CEC2020 - RW - 47
    case 47
        fobj = @F47;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
            %CEC2020 - RW - 48
    case 48
        fobj = @F48;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
            %CEC2020 - RW - 49
    case 49
        fobj = @F49;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
        
    %CEC2020 - RW - 50
    case 50
        fobj = @F50;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;        
    %CEC2020 - RW - 51
    case 51
        fobj = @F51;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;        
    %CEC2020 - RW - 52
    case 52
        fobj = @F52;
        dim       = Par.n;
        n_g       = Par.g;
        h       = Par.h;
        lb    = Par.xmin;
        ub    = Par.xmax;
end

end

% F1
function fitness = F1(x) 
    [f,g,h] = cec20_func(x,1);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F2
function fitness = F2(x) 
    [f,g,h] = cec20_func(x,2);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F3
function fitness = F3(x) 
    [f,g,h] = cec20_func(x,3);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F4
function fitness = F4(x) 
    [f,g,h] = cec20_func(x,4);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F5
function fitness = F5(x) 
    [f,g,h] = cec20_func(x,5);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F6
function fitness = F6(x) 
    [f,g,h] = cec20_func(x,6);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F7
function fitness = F7(x) 
    [f,g,h] = cec20_func(x,7);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F8
function fitness = F8(x) 
    [f,g,h] = cec20_func(x,8);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F9
function fitness = F9(x) 
    [f,g,h] = cec20_func(x,9);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F10
function fitness = F10(x) 
    [f,g,h] = cec20_func(x,10);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F11
function fitness = F11(x) 
    [f,g,h] = cec20_func(x,11);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F12
function fitness = F12(x) 
    [f,g,h] = cec20_func(x,12);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F13
function fitness = F13(x) 
    [f,g,h] = cec20_func(x,13);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F14
function fitness = F14(x) 
    [f,g,h] = cec20_func(x,14);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
    % F15
function fitness = F15(x) 
    [f,g,h] = cec20_func(x,15);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F16
function fitness = F16(x) 
    [f,g,h] = cec20_func(x,16);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F17
function fitness = F17(x) 
    [f,g,h] = cec20_func(x,17);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F18
function fitness = F18(x) 
    [f,g,h] = cec20_func(x,18);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F19
function fitness = F19(x) 
    [f,g,h] = cec20_func(x,19);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F20
function fitness = F20(x) 
    [f,g,h] = cec20_func(x,20);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F21
function fitness = F21(x) 
    [f,g,h] = cec20_func(x,21);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F22
function fitness = F22(x) 
    [f,g,h] = cec20_func(x,22);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F23
function fitness = F23(x) 
    [f,g,h] = cec20_func(x,23);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F24
function fitness = F24(x) 
    [f,g,h] = cec20_func(x,24);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F25
function fitness = F25(x) 
    [f,g,h] = cec20_func(x,25);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F26
function fitness = F26(x) 
    [f,g,h] = cec20_func(x,26);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F27
function fitness = F27(x) 
    [f,g,h] = cec20_func(x,27);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F28
function fitness = F28(x) 
    [f,g,h] = cec20_func(x,28);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F29
function fitness = F29(x) 
    [f,g,h] = cec20_func(x,29);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F30
function fitness = F30(x) 
    [f,g,h] = cec20_func(x,30);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F31
function fitness = F31(x) 
    [f,g,h] = cec20_func(x,31);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F32
function fitness = F32(x) 
    [f,g,h] = cec20_func(x,32);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F33
function fitness = F33(x) 
    [f,g,h] = cec20_func(x,33);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F34
function fitness = F34(x) 
    [f,g,h] = cec20_func(x,34);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F35
function fitness = F35(x) 
    [f,g,h] = cec20_func(x,35);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F36
function fitness = F36(x) 
    [f,g,h] = cec20_func(x,36);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F37
function fitness = F37(x) 
    [f,g,h] = cec20_func(x,37);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F38
function fitness = F38(x) 
    [f,g,h] = cec20_func(x,38);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F39
function fitness = F39(x) 
    [f,g,h] = cec20_func(x,39);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F40
function fitness = F40(x) 
    [f,g,h] = cec20_func(x,40);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F41
function fitness = F41(x) 
    [f,g,h] = cec20_func(x,41);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F42
function fitness = F42(x) 
    [f,g,h] = cec20_func(x,42);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F43
function fitness = F43(x) 
    [f,g,h] = cec20_func(x,43);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F44
function fitness = F44(x) 
    [f,g,h] = cec20_func(x,44);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F45
function fitness = F45(x) 
    [f,g,h] = cec20_func(x,45);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F46
function fitness = F46(x) 
    [f,g,h] = cec20_func(x,46);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F47
function fitness = F47(x) 
    [f,g,h] = cec20_func(x,47);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F48
function fitness = F48(x) 
    [f,g,h] = cec20_func(x,48);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F49
function fitness = F49(x) 
    [f,g,h] = cec20_func(x,49);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F50
function fitness = F50(x) 
    [f,g,h] = cec20_func(x,50);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F51
function fitness = F51(x) 
    [f,g,h] = cec20_func(x,51);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end
% F52
function fitness = F52(x) 
    [f,g,h] = cec20_func(x,52);
    g_sum=0;
    h_sum=0;
    for i=1:length(g)
        if g(i)>0
            g_sum = g_sum + 1000000;
        end
    end
    for i=1:length(h)
        if abs(h(i))-0.0001>0
            h_sum = h_sum + 1000000;
        end
    end
    fitness = f + g_sum + h_sum;
end