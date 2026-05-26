function test_realsense_setup()
    % Test script for RealSense D435 in MATLAB
    % This script tests the complete setup of RealSense SDK 2.0 for MATLAB
    
    fprintf('=== RealSense MATLAB Setup Test ===\n\n');
    
    try
        % Test 1: Check if +realsense folder is in path
        fprintf('1. Testing +realsense package availability...\n');
        if exist('+realsense', 'dir')
            fprintf('   ✓ +realsense folder found\n');
        else
            error('+realsense folder not found in current directory');
        end
        
        % Test 2: Check if MEX file exists
        fprintf('2. Testing MEX file availability...\n');
        if exist('+realsense/librealsense_mex.mexw64', 'file')
            fprintf('   ✓ librealsense_mex.mexw64 found\n');
        else
            error('librealsense_mex.mexw64 not found');
        end
        
        % Test 3: Check if DLL exists
        fprintf('3. Testing DLL availability...\n');
        if exist('+realsense/realsense2.dll', 'file')
            fprintf('   ✓ realsense2.dll found\n');
        else
            error('realsense2.dll not found');
        end
        
        % Test 4: Test if we can create a pipeline object
        fprintf('4. Testing RealSense pipeline creation...\n');
        pipe = realsense.pipeline();
        fprintf('   ✓ Pipeline created successfully\n');
        
        % Test 5: Test if we can create a colorizer object
        fprintf('5. Testing RealSense colorizer creation...\n');
        colorizer = realsense.colorizer();
        fprintf('   ✓ Colorizer created successfully\n');
        
        % Test 6: Test if we can get device info
        fprintf('6. Testing device enumeration...\n');
        try
            ctx = realsense.context();
            devices = ctx.query_devices();
            if devices.size() > 0
                fprintf('   ✓ Found %d RealSense device(s)\n', devices.size());
                for i = 1:devices.size()
                    dev = devices.get(i);
                    name = dev.get_info(realsense.camera_info.name);
                    fprintf('     Device %d: %s\n', i, name);
                end
            else
                fprintf('   ⚠ No RealSense devices found (this is normal if no camera is connected)\n');
            end
        catch
            fprintf('   ⚠ Device enumeration failed, but this may be normal\n');
        end
        
        % Test 7: Test if we can create a config object
        fprintf('7. Testing config object creation...\n');
        cfg = realsense.config();
        fprintf('   ✓ Config object created successfully\n');
        
        fprintf('\n=== Setup Test Results ===\n');
        fprintf('✓ RealSense MATLAB bindings are working correctly!\n');
        fprintf('✓ You can now use the RealSense D435 with MATLAB.\n\n');
        
        % Provide usage examples
        fprintf('=== Usage Examples ===\n');
        fprintf('To capture depth data:\n');
        fprintf('  realsense.depth_example()\n\n');
        fprintf('To capture color and depth:\n');
        fprintf('  realsense.capture_example()\n\n');
        fprintf('To generate point cloud:\n');
        fprintf('  realsense.pointcloud_example()\n\n');
        
    catch ME
        fprintf('\n=== Setup Test Failed ===\n');
        fprintf('Error: %s\n', ME.message);
        fprintf('Stack trace:\n');
        for i = 1:length(ME.stack)
            fprintf('  %s (line %d)\n', ME.stack(i).name, ME.stack(i).line);
        end
        
        fprintf('\n=== Troubleshooting Tips ===\n');
        fprintf('1. Make sure you have a RealSense camera connected via USB 3.0\n');
        fprintf('2. Ensure the +realsense folder is in your MATLAB path\n');
        fprintf('3. Check that realsense2.dll is in the same folder as the MEX file\n');
        fprintf('4. Try restarting MATLAB if the DLL was recently added\n');
    end
end
