classdef realsense_project_template < handle
    % RealSense Project Template
    % A comprehensive template for RealSense applications
    
    properties
        pipe           % RealSense pipeline
        colorizer      % Depth colorizer
        pc            % Point cloud processor
        align         % Frame aligner
        config        % Stream configuration
        is_running    % Stream status
        frame_count   % Frame counter
    end
    
    methods
        function obj = realsense_project_template()
            % Constructor - Initialize RealSense components
            fprintf('Initializing RealSense Project Template...\n');
            
            try
                % Create RealSense objects
                obj.pipe = realsense.pipeline();
                obj.colorizer = realsense.colorizer();
                obj.pc = realsense.pointcloud();
                obj.align = realsense.align(realsense.stream.color);
                obj.config = realsense.config();
                
                % Configure streams
                obj.config.enable_stream(realsense.stream.depth, 640, 480, realsense.format.z16, 30);
                obj.config.enable_stream(realsense.stream.color, 640, 480, realsense.format.bgr8, 30);
                
                obj.is_running = false;
                obj.frame_count = 0;
                
                fprintf('RealSense components initialized successfully!\n');
                
            catch ME
                fprintf('Error initializing RealSense: %s\n', ME.message);
                rethrow(ME);
            end
        end
        
        function start_streaming(obj)
            % Start RealSense streaming
            if ~obj.is_running
                fprintf('Starting RealSense streams...\n');
                profile = obj.pipe.start(obj.config);
                
                % Get device info
                dev = profile.get_device();
                name = dev.get_info(realsense.camera_info.name);
                fprintf('Connected to: %s\n', name);
                
                obj.is_running = true;
                fprintf('Streaming started successfully!\n');
            end
        end
        
        function stop_streaming(obj)
            % Stop RealSense streaming
            if obj.is_running
                fprintf('Stopping RealSense streams...\n');
                obj.pipe.stop();
                obj.is_running = false;
                fprintf('Streaming stopped.\n');
            end
        end
        
        function [depth_img, color_img, depth_matrix] = get_frames(obj)
            % Get current depth and color frames
            if ~obj.is_running
                error('Streaming not started. Call start_streaming() first.');
            end
            
            % Wait for frames
            fs = obj.pipe.wait_for_frames();
            
            % Align depth to color frame
            aligned_fs = obj.align.process(fs);
            
            % Get frames
            depth = aligned_fs.get_depth_frame();
            color = aligned_fs.get_color_frame();
            
            % Colorize depth
            colorized_depth = obj.colorizer.colorize(depth);
            
            % Convert to MATLAB format
            depth_data = colorized_depth.get_data();
            depth_img = permute(reshape(depth_data', [3, colorized_depth.get_width(), colorized_depth.get_height()]), [3 2 1]);
            
            color_data = color.get_data();
            color_img = permute(reshape(color_data', [3, color.get_width(), color.get_height()]), [3 2 1]);
            
            % Get raw depth matrix for measurements
            raw_depth_data = depth.get_data();
            depth_matrix = reshape(raw_depth_data, [depth.get_width(), depth.get_height()])';
            
            obj.frame_count = obj.frame_count + 1;
        end
        
        function distance = measure_distance(obj, x, y)
            % Measure distance at specific pixel coordinates
            [~, ~, depth_matrix] = obj.get_frames();
            
            if x >= 1 && x <= size(depth_matrix, 2) && y >= 1 && y <= size(depth_matrix, 1)
                depth_value = depth_matrix(y, x);
                distance = depth_value / 1000.0; % Convert to meters
            else
                distance = NaN;
            end
        end
        
        function [vertices, colors] = get_pointcloud(obj)
            % Generate 3D point cloud
            [~, ~, depth_matrix] = obj.get_frames();
            
            % Get depth frame for point cloud
            fs = obj.pipe.wait_for_frames();
            depth = fs.get_depth_frame();
            
            % Calculate point cloud
            points = obj.pc.calculate(depth);
            vertices = points.get_vertices();
            texture = points.get_texture_coordinates();
            
            % Convert to MATLAB format
            vertices_data = vertices.get_data();
            texture_data = texture.get_data();
            
            num_points = length(vertices_data) / 3;
            vertices = reshape(vertices_data, [3, num_points])';
            texture = reshape(texture_data, [2, num_points])';
            
            % Get color data
            color = fs.get_color_frame();
            color_data = color.get_data();
            color_img = permute(reshape(color_data', [3, color.get_width(), color.get_height()]), [3 2 1]);
            
            % Sample colors
            colors = zeros(num_points, 3);
            for i = 1:num_points
                u = texture(i, 1);
                v = texture(i, 2);
                
                x = round(u * color.get_width());
                y = round(v * color.get_height());
                
                x = max(1, min(x, color.get_width()));
                y = max(1, min(y, color.get_height()));
                
                colors(i, :) = double(color_img(y, x, :)) / 255.0;
            end
            
            % Filter valid points
            valid_indices = vertices(:, 3) ~= 0;
            vertices = vertices(valid_indices, :);
            colors = colors(valid_indices, :);
        end
        
        function save_frames(obj, filename_prefix)
            % Save current frames to files
            [depth_img, color_img, ~] = obj.get_frames();
            
            depth_filename = sprintf('%s_depth.jpg', filename_prefix);
            color_filename = sprintf('%s_color.jpg', filename_prefix);
            
            imwrite(depth_img, depth_filename);
            imwrite(color_img, color_filename);
            
            fprintf('Frames saved: %s, %s\n', depth_filename, color_filename);
        end
        
        function display_live_stream(obj, duration_seconds)
            % Display live stream for specified duration
            if nargin < 2
                duration_seconds = 10; % Default 10 seconds
            end
            
            fprintf('Starting live stream for %.1f seconds...\n', duration_seconds);
            
            % Create figure
            figure('Name', 'RealSense Live Stream', 'NumberTitle', 'off', ...
                   'Position', [100, 100, 1200, 500]);
            
            start_time = tic;
            
            while toc(start_time) < duration_seconds
                [depth_img, color_img, ~] = obj.get_frames();
                
                % Display images
                subplot(1, 2, 1);
                imshow(color_img);
                title(sprintf('Color (Frame: %d)', obj.frame_count));
                
                subplot(1, 2, 2);
                imshow(depth_img);
                title(sprintf('Depth (Frame: %d)', obj.frame_count));
                
                drawnow;
            end
            
            fprintf('Live stream completed.\n');
        end
        
        function delete(obj)
            % Destructor - Clean up resources
            if obj.is_running
                obj.stop_streaming();
            end
        end
    end
end
