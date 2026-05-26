function realsense_live_test()
    % Live RealSense test script
    % This script continuously captures and displays depth data from your RealSense camera
    
    fprintf('=== RealSense Live Test ===\n');
    fprintf('Press Ctrl+C to stop the test\n\n');
    
    try
        % Create pipeline and colorizer
        pipe = realsense.pipeline();
        colorizer = realsense.colorizer();
        
        fprintf('Starting RealSense stream...\n');
        
        % Start streaming
        profile = pipe.start();
        
        % Get device name
        dev = profile.get_device();
        name = dev.get_info(realsense.camera_info.name);
        fprintf('Connected to: %s\n', name);
        
        % Create figure for display
        figure('Name', 'RealSense Live Depth Stream', 'NumberTitle', 'off', ...
               'Position', [100, 100, 800, 600]);
        
        frame_count = 0;
        start_time = tic;
        
        fprintf('Streaming depth data... (Press Ctrl+C to stop)\n');
        
        while true
            % Wait for frames
            fs = pipe.wait_for_frames();
            
            % Get depth frame
            depth = fs.get_depth_frame();
            
            % Colorize the depth frame
            color = colorizer.colorize(depth);
            
            % Convert to MATLAB image format
            data = color.get_data();
            img = permute(reshape(data', [3, color.get_width(), color.get_height()]), [3 2 1]);
            
            % Display the image
            imshow(img);
            title(sprintf('Live Depth Stream - %s (Frame: %d)', name, frame_count));
            
            % Update frame count and calculate FPS
            frame_count = frame_count + 1;
            elapsed_time = toc(start_time);
            fps = frame_count / elapsed_time;
            
            % Display FPS in figure
            text(10, 30, sprintf('FPS: %.1f', fps), 'Color', 'white', 'FontSize', 12, 'FontWeight', 'bold');
            
            % Force draw
            drawnow;
            
            % Check if figure is still open
            if ~ishandle(gcf)
                break;
            end
        end
        
    catch ME
        if strcmp(ME.identifier, 'MATLAB:interrupt')
            fprintf('\nTest stopped by user.\n');
        else
            fprintf('Error: %s\n', ME.message);
        end
    end
    
    % Clean up
    if exist('pipe', 'var')
        pipe.stop();
        fprintf('Stream stopped.\n');
    end
    
    fprintf('Test completed.\n');
end
