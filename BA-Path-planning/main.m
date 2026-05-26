clc;
clear;

%% Parameters
MaxIt = 5;

modbusIPAddress       = '172.31.1.26';
modbusPort            = 502;
serverId              = 1;
coilAddressStatus     = 9051;   % READY coil (1 = ready)
registerAddressOutput = 9005;   % start register for [x1 y1 x2 y2 ...] as float32

%% Connect
m = modbus('tcpip', modbusIPAddress);
fprintf("Connected\n");

%% Wait READY (optional)
t0 = tic; readyTimeout = 100; poll = 0.05;
while toc(t0) < readyTimeout
    rdy = read(m,'coils', coilAddressStatus, 1);
    if ~isempty(rdy) && logical(rdy(1)), fprintf("Ready\n"); break; end
    pause(poll);
end
if isempty(rdy) || ~logical(rdy(1))
    error('Timeout waiting for READY coil.');
end

%% Image Processing
% Taking the top-view
run('C:\Users\hfsul\Documents\GitHub\BA-Path-planning\Image Processing\startup_camera_project.m');
run('C:\Users\hfsul\Documents\GitHub\BA-Path-planning\Image Processing\Capture_image_robotReady.m');
Current_Image = 'C:\Users\hfsul\Documents\GitHub\BA-Path-planning\Image Processing\demo_capture_color.jpg';
% Grid Matrix Extraction
run ('C:\Users\hfsul\Documents\GitHub\BA-Path-planning\Image Processing\Calibration etc\Calibration_and_overlay.m')
%save gridBlocked.mat gridBlocked
save insideBW.mat insideBW

%% Bees Algorithm
%obstacles = obstacles_from_grid(gridBlocked, [0,0], goalPoint, minDist, origin)
ResultPath = Call_Bees(MaxIt);

controlPoints(:,1)=ResultPath(:,2);
controlPoints(:,2)=ResultPath(:,1);
%% Control Points
assert(exist('controlPoints','var')==1 && size(controlPoints,2)==2, ...
    'Provide controlPoints as Nx2.');
assert(size(controlPoints,1) >= 3, 'At least 3 (x,y) pairs required.');

N = size(controlPoints,1);

% Keep as double for write()
flat = controlPoints.';        % 2 x N
flat = flat(:).';              % 1 x (2N)
flat2 = [N flat];

%% Sending Info to Robot
% Bulk write: pass DOUBLE values, but specify 'single' precision
write(m,'holdingregs',registerAddressOutput, flat2, serverId, 'single');  % <- flat is double
fprintf('Wrote %d control points (%d float32s) starting at HR %d.\n', ...
    size(controlPoints,1), numel(flat2), registerAddressOutput);

% data = read(m,'holdingregs', 9003   , 15, 'single');
