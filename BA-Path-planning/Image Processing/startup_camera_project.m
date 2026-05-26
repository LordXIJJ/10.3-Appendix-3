function startup_camera_project()
    % Startup script for RealSense Camera Project
    % This script sets up the MATLAB path and initializes the project
    
    fprintf('=== RealSense Camera Project Startup ===\n');
    
    % Get the current directory (should be the Camera project folder)
    project_dir = pwd;
    
    % Add the project directory to MATLAB path
    addpath(project_dir);
    
    % Add the +realsense package to path
    realsense_path = fullfile(project_dir, '+realsense');
    if exist(realsense_path, 'dir')
        addpath(realsense_path);
        fprintf('✓ RealSense package added to path\n');
    else
        fprintf('⚠ Warning: +realsense folder not found in %s\n', project_dir);
    end
    
    % Test if RealSense is working
    try
        fprintf('Testing RealSense setup...\n');
        test_realsense_setup();
        fprintf('✓ RealSense setup verified successfully!\n');
    catch ME
        fprintf('⚠ Warning: RealSense test failed: %s\n', ME.message);
        fprintf('Make sure your RealSense camera is connected.\n');
    end
    
    fprintf('\n=== Camera Project Ready! ===\n');
    fprintf('Available functions:\n');
    fprintf('  - test_realsense_setup()        (Test setup)\n');
    fprintf('  - simple_realsense_test()       (Basic test)\n');
    fprintf('  - realsense_live_test()         (Live streaming)\n');
    fprintf('  - realsense_color_depth_test()  (Color + depth)\n');
    fprintf('  - realsense_distance_measurement() (Distance measurement)\n');
    fprintf('  - realsense_3d_pointcloud()     (3D visualization)\n');
    fprintf('  - demo_project_template()       (Complete demo)\n');
    fprintf('\nRun "demo_project_template()" to see all features!\n');
end
