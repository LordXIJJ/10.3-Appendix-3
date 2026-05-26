clc; clear;

%% Config
modbusIPAddress       = '172.31.1.26';
modbusPort            = 502;
serverId              = 1;
coilAddressStatus     = 9051;   % READY coil (1 = ready)
registerAddressOutput = 9003;   % start register for [x1 y1 x2 y2 ...] as float32
load controlPointsTest.mat;

%% Control points (N x 2)
% controlPoints = [100 50; 150 100; 200 75];  % example
assert(exist('controlPoints','var')==1 && size(controlPoints,2)==2, ...
    'Provide controlPoints as Nx2.');
assert(size(controlPoints,1) >= 3, 'At least 3 (x,y) pairs required.');

N = size(controlPoints,1);

% Keep as double for write()
flat = controlPoints.';        % 2 x N
flat = flat(:).';              % 1 x (2N)
flat = [N flat]; 
values1 = [-11, 10, 50, 123.5, -10, 20];

%% Connect
m = modbus('tcpip', modbusIPAddress);
fprintf("Connected\n");

%% Wait READY (optional)
t0 = tic; readyTimeout = 10; poll = 0.05;
while toc(t0) < readyTimeout
    rdy = read(m,'coils', coilAddressStatus, 1);
    if ~isempty(rdy) && logical(rdy(1)), fprintf("Ready\n"); break; end
    pause(poll);
end
if isempty(rdy) || ~logical(rdy(1))
    error('Timeout waiting for READY coil.');
end

%% Bulk write: pass DOUBLE values, but specify 'single' precision
write(m,'holdingregs',registerAddressOutput, flat, serverId, 'single');  % <- flat is double
fprintf('Wrote %d control points (%d float32s) starting at HR %d.\n', ...
    size(controlPoints,1), numel(flat), registerAddressOutput);

data = read(m,'holdingregs', 9003   , 15, 'single')
