function realsense_3d_pointcloud()
    % RealSense 3D Point Cloud Visualization
    % This script generates and displays a 3D point cloud from depth data
    
    fprintf('=== RealSense 3D Point Cloud ===\n');
    
    try
        % Create pipeline, colorizer, and pointcloud processor
        pipe = realsense.pipeline();
        colorizer = realsense.colorizer();
        pc = realsense.pointcloud();
        
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
        fprintf('Waiting for camera to settle...\n');
        for i = 1:10
            fs = pipe.wait_for_frames();
        end
        
        % Get frames
        depth = fs.get_depth_frame();
        color = fs.get_color_frame();
        
        fprintf('Generating point cloud...\n');
        
        % Generate point cloud
        points = pc.calculate(depth);
        
        % Get point cloud data
        vertices = points.get_vertices();
        texture = points.get_texture_coordinates();
        
        % Convert to MATLAB format
        vertices_data = vertices.get_data();
        texture_data = texture.get_data();
        
        % Reshape data
        num_points = length(vertices_data) / 3;
        vertices_matrix = reshape(vertices_data, [3, num_points])';
        texture_matrix = reshape(texture_data, [2, num_points])';
        
        % Get color data
        color_data = color.get_data();
        color_img = permute(reshape(color_data', [3, color.get_width(), color.get_height()]), [3 2 1]);
        
        % Sample colors for point cloud
        colors = zeros(num_points, 3);
        for i = 1:num_points
            u = texture_matrix(i, 1);
            v = texture_matrix(i, 2);
            
            % Convert texture coordinates to pixel coordinates
            x = round(u * color.get_width());
            y = round(v * color.get_height());
            
            % Clamp coordinates
            x = max(1, min(x, color.get_width()));
            y = max(1, min(y, color.get_height()));
            
            % Get color
            colors(i, :) = double(color_img(y, x, :)) / 255.0;
        end
        
        % Filter out invalid points (where depth is 0)
        valid_indices = vertices_matrix(:, 3) ~= 0;
        valid_vertices = vertices_matrix(valid_indices, :);
        valid_colors = colors(valid_indices, :);
        
        fprintf('Point cloud generated with %d valid points\n', size(valid_vertices, 1));
        
        % Create 3D visualization
        figure('Name', 'RealSense 3D Point Cloud', 'NumberTitle', 'off', ...
               'Position', [100, 100, 1000, 800]);
        
        % Plot point cloud
        scatter3(valid_vertices(:, 1), valid_vertices(:, 2), valid_vertices(:, 3), ...
                1, valid_colors, 'filled');
        
        % Set up 3D view
        axis equal;
        grid on;
        xlabel('X (meters)');
        ylabel('Y (meters)');
        zlabel('Z (meters)');
        title(sprintf('3D Point Cloud - %s', name));
        
        % Add colorbar
        colormap('jet');
        colorbar;
        
        % Set view
        view(45, 30);
        
        fprintf('3D point cloud displayed successfully!\n');
        fprintf('Use mouse to rotate, zoom, and pan the view\n');
        
        % Stop streaming
        pipe.stop();
        
    catch ME
        fprintf('Error: %s\n', ME.message);
        if exist('pipe', 'var')
            pipe.stop();
        end
    end
end
