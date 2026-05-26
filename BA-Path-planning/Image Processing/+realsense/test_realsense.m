% Test script for RealSense D435 in MATLAB
try
    % Add current directory to path
    addpath(pwd);
    
    % Test if we can create a pipeline object
    fprintf('Testing RealSense pipeline creation...\n');
    pipe = realsense.pipeline();
    fprintf('✓ Pipeline created successfully\n');
    
    % Test if we can create a colorizer object
    fprintf('Testing RealSense colorizer creation...\n');
    colorizer = realsense.colorizer();
    fprintf('✓ Colorizer created successfully\n');
    
    % Test if we can get device info
    fprintf('Testing device enumeration...\n');
    ctx = realsense.context();
    devices = ctx.query_devices();
    if devices.size() > 0
        fprintf('✓ Found %d RealSense device(s)\n', devices.size());
        for i = 1:devices.size()
            dev = devices.get(i);
            name = dev.get_info(realsense.camera_info.name);
            fprintf('  Device %d: %s\n', i, name);
        end
    else
        fprintf('⚠ No RealSense devices found\n');
    end
    
    fprintf('\nRealSense MATLAB bindings are working correctly!\n');
    fprintf('You can now use the RealSense D435 with MATLAB.\n');
    
catch ME
    fprintf('Error: %s\n', ME.message);
    fprintf('Stack trace:\n');
    for i = 1:length(ME.stack)
        fprintf('  %s (line %d)\n', ME.stack(i).name, ME.stack(i).line);
    end
end

