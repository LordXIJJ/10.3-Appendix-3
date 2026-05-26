function realsense_distance_measurement()
    % RealSense Distance Measurement
    % This script measures distances to objects in the scene
    
    fprintf('=== RealSense Distance Measurement ===\n');
    fprintf('Click on any point in the depth image to measure distance\n');
    fprintf('Press any key to exit\n\n');
    
    try
        % Create pipeline and colorizer
        pipe = realsense.pipeline();
        colorizer = realsense.colorizer();
        
        % Create configuration
        cfg = realsense.config();
        cfg.enable_stream(realsense.stream.depth, 640, 480, realsense.format.z16, 30);
        cfg.enable_stream(realsense.stream.color, 640, 480, realsense.format.bgr8, 30);
        
        fprintf('Starting streams...\n');
        
        % Start streaming
        profile = pipe.start(cfg);
        
        % Get device name
        dev = profile.get_device();
        name = dev.get_info(realsense.camera_info.name);
        fprintf('Connected to: %s\n', name);
        
        % Wait for frames to settle
        for i = 1:5
            fs = pipe.wait_for_frames();
        end
        
        % Create figure
        figure('Name', 'Distance Measurement', 'NumberTitle', 'off', ...
               'Position', [100, 100, 1200, 500]);
        
        while true
            % Get frames
            fs = pipe.wait_for_frames();
            depth = fs.get_depth_frame();
            color = fs.get_color_frame();
            
            % Colorize depth
            colorized_depth = colorizer.colorize(depth);
            
            % Convert to MATLAB format
            depth_data = colorized_depth.get_data();
            depth_img = permute(reshape(depth_data', [3, colorized_depth.get_width(), colorized_depth.get_height()]), [3 2 1]);
            
            color_data = color.get_data();
            color_img = permute(reshape(color_data', [3, color.get_width(), color.get_height()]), [3 2 1]);
            
            % Display images
            subplot(1, 2, 1);
            imshow(color_img);
            title('Color Image - Click to measure distance');
            
            subplot(1, 2, 2);
            imshow(depth_img);
            title('Depth Image - Click to measure distance');
            
            % Get raw depth data for measurements
            raw_depth_data = depth.get_data();
            depth_matrix = reshape(raw_depth_data, [depth.get_width(), depth.get_height()])';
            
            % Set up click callback
            [x, y, button] = ginput(1);
            
            if isempty(x) || button == 27  % ESC key or no input
                break;
            end
            
            % Convert click coordinates to image coordinates
            x = round(x);
            y = round(y);
            
            % Check if click is within image bounds
            if x >= 1 && x <= size(depth_matrix, 2) && y >= 1 && y <= size(depth_matrix, 1)
                % Get depth value at clicked point
                depth_value = depth_matrix(y, x);
                
                % Convert depth units to meters (RealSense uses millimeters)
                distance_meters = depth_value / 1000.0;
                
                % Display measurement
                fprintf('Distance at point (%d, %d): %.3f meters (%.1f cm)\n', ...
                        x, y, distance_meters, distance_meters * 100);
                
                % Mark the point on both images
                subplot(1, 2, 1);
                hold on;
                plot(x, y, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
                text(x+10, y-10, sprintf('%.1f cm', distance_meters*100), ...
                     'Color', 'red', 'FontSize', 12, 'FontWeight', 'bold');
                hold off;
                
                subplot(1, 2, 2);
                hold on;
                plot(x, y, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
                text(x+10, y-10, sprintf('%.1f cm', distance_meters*100), ...
                     'Color', 'red', 'FontSize', 12, 'FontWeight', 'bold');
                hold off;
            else
                fprintf('Click is outside image bounds\n');
            end
            
            drawnow;
        end
        
        % Stop streaming
        pipe.stop();
        fprintf('Measurement session ended.\n');
        
    catch ME
        fprintf('Error: %s\n', ME.message);
        if exist('pipe', 'var')
            pipe.stop();
        end
    end
end
