function Capture_image_robotReady()
    try
        % Create template instance
        rs = realsense_project_template();
        
        % Start streaming
        rs.start_streaming();
        
        fprintf('Basic frame capture\n');
        start_time = tic;
        while toc(start_time) < 1
            disp('Waiting for eyes to open');
        end
        [depth_img, color_img, depth_matrix] = rs.get_frames();
            
            %[depth_img, color_img, depth_matrix] = rs.get_frames();
        
        figure('Name', 'Demo 1: Basic Frames with Distance Measurements', 'NumberTitle', 'off', ...
               'Position', [100, 100, 1200, 700]);
        % Calculate center point distance
        center_x = size(depth_matrix, 2) / 2;
        center_y = size(depth_matrix, 1) / 2;
        center_distance = rs.measure_distance(center_x, center_y);
        
        %subplot(2, 2, 1);
        
        imshow(color_img);
        title('Color Frame');
        hold on;
        plot(center_x, center_y, 'r+', 'MarkerSize', 15, 'LineWidth', 3);
        hold off;
        
        % subplot(2, 2, 2);
        % imshow(depth_img);
        % title('Depth Frame');
        % hold on;
        % plot(center_x, center_y, 'r+', 'MarkerSize', 15, 'LineWidth', 3);
        % hold off;
        
        % Display measurements below images
        % subplot(2, 2, 3);
        % axis off;
        % text(0.05, 0.9, sprintf('Center Point Distance: %.1f cm', center_distance*100), ...
        %      'FontSize', 16, 'FontWeight', 'bold');
        % text(0.05, 0.75, sprintf('Center Coordinates: (%d, %d)', center_x, center_y), ...
        %      'FontSize', 14);
        % text(0.05, 0.6, sprintf('Image Size: %dx%d', size(depth_matrix, 2), size(depth_matrix, 1)), ...
        %      'FontSize', 14);
        % title('Distance Measurements', 'FontSize', 16, 'FontWeight', 'bold');
        % 
        % subplot(2, 2, 4);
        % axis off;
        % text(0.05, 0.9, 'Measurement Info:', 'FontSize', 16, 'FontWeight', 'bold');
        % text(0.05, 0.75, '• Red cross marks center point', 'FontSize', 12);
        % text(0.05, 0.6, '• Distance measured in centimeters', 'FontSize', 12);
        % text(0.05, 0.45, '• Coordinates in pixel space', 'FontSize', 12);
        % text(0.05, 0.3, '• RealSense D435 depth camera', 'FontSize', 12);
        % title('Information', 'FontSize', 16, 'FontWeight', 'bold');
        rs.save_frames('demo_capture');
    catch ME
        fprintf('Error in demo: %s\n', ME.message);
        if exist('rs', 'var')
            rs.stop_streaming();
        end
    end
end