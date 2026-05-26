function realsense_color_depth_test()
    % RealSense Color and Depth Test
    % This script captures both color and depth data simultaneously
    
    fprintf('=== RealSense Color & Depth Test ===\n');
    
    try
        % Create pipeline and colorizer
        pipe = realsense.pipeline();
        colorizer = realsense.colorizer();
        
        % Create configuration
        cfg = realsense.config();
        cfg.enable_stream(realsense.stream.depth, 640, 480, realsense.format.z16, 30);
        cfg.enable_stream(realsense.stream.color, 640, 480, realsense.format.bgr8, 30);
        
        fprintf('Starting color and depth streams...\n');
        
        % Start streaming with configuration
        profile = pipe.start(cfg);
        
        % Get device name
        dev = profile.get_device();
        name = dev.get_info(realsense.camera_info.name);
        fprintf('Connected to: %s\n', name);
        
        % Wait for frames to settle
        fprintf('Waiting for camera to settle...\n');
        for i = 1:10
            fs = pipe.wait_for_frames();
        end
        
        % Get frames
        depth = fs.get_depth_frame();
        color = fs.get_color_frame();
        
        fprintf('Captured frames:\n');
        fprintf('  Depth: %dx%d\n', depth.get_width(), depth.get_height());
        fprintf('  Color: %dx%d\n', color.get_width(), color.get_height());
        
        % Colorize depth frame
        colorized_depth = colorizer.colorize(depth);
        
        % Convert frames to MATLAB format
        depth_data = colorized_depth.get_data();
        depth_img = permute(reshape(depth_data', [3, colorized_depth.get_width(), colorized_depth.get_height()]), [3 2 1]);
        
        color_data = color.get_data();
        color_img = permute(reshape(color_data', [3, color.get_width(), color.get_height()]), [3 2 1]);
        
        % Display both images side by side
        figure('Name', 'RealSense Color & Depth', 'NumberTitle', 'off', ...
               'Position', [100, 100, 1200, 500]);
        
        subplot(1, 2, 1);
        imshow(color_img);
        title('Color Image');
        
        subplot(1, 2, 2);
        imshow(depth_img);
        title('Depth Image (Colorized)');
        
        % Stop streaming
        pipe.stop();
        fprintf('Test completed successfully!\n');
        
        % Save images
        imwrite(color_img, 'realsense_color.jpg');
        imwrite(depth_img, 'realsense_depth.jpg');
        fprintf('Images saved as realsense_color.jpg and realsense_depth.jpg\n');
        
    catch ME
        fprintf('Error: %s\n', ME.message);
        if exist('pipe', 'var')
            pipe.stop();
        end
    end
end
