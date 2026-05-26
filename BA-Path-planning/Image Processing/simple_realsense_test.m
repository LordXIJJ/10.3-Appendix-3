function simple_realsense_test()
    % Simple RealSense test script
    % This script captures a single depth frame and displays it
    
    fprintf('Starting RealSense test...\n');
    
    try
        % Create pipeline and colorizer
        pipe = realsense.pipeline();
        colorizer = realsense.colorizer();
        
        fprintf('Starting stream...\n');
        
        % Start streaming
        profile = pipe.start();
        
        % Get device name
        dev = profile.get_device();
        name = dev.get_info(realsense.camera_info.name);
        fprintf('Connected to: %s\n', name);
        
        % Wait for frames to settle
        fprintf('Waiting for camera to settle...\n');
        for i = 1:5
            fs = pipe.wait_for_frames();
        end
        
        % Get depth frame
        depth = fs.get_depth_frame();
        fprintf('Captured depth frame: %dx%d\n', depth.get_width(), depth.get_height());
        
        % Colorize the depth frame
        color = colorizer.colorize(depth);
        
        % Convert to MATLAB image format
        data = color.get_data();
        img = permute(reshape(data', [3, color.get_width(), color.get_height()]), [3 2 1]);
        
        % Display the image
        figure('Name', 'RealSense Depth Test', 'NumberTitle', 'off');
        imshow(img);
        title(sprintf('Depth frame from %s', name));
        
        % Stop streaming
        pipe.stop();
        fprintf('Test completed successfully!\n');
        
    catch ME
        fprintf('Error: %s\n', ME.message);
        fprintf('Make sure your RealSense camera is connected via USB 3.0\n');
    end
end
