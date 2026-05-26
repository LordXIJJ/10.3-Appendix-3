# RealSense Camera Project

## 📁 Project Location
`C:\Users\User\MATLAB\Projects\Camera`

## 🚀 Quick Start

1. **Navigate to the project directory:**
   ```matlab
   cd('C:\Users\User\MATLAB\Projects\Camera')
   ```

2. **Run the startup script:**
   ```matlab
   startup_camera_project()
   ```

3. **Test your setup:**
   ```matlab
   test_realsense_setup()
   ```

4. **Try the demo:**
   ```matlab
   demo_project_template()
   ```

## 📋 Available Functions

### Basic Tests
- `test_realsense_setup()` - Verify RealSense setup
- `simple_realsense_test()` - Basic depth capture
- `realsense_live_test()` - Live streaming

### Advanced Features
- `realsense_color_depth_test()` - Color + depth capture
- `realsense_distance_measurement()` - Interactive distance measurement
- `realsense_3d_pointcloud()` - 3D point cloud visualization

### Project Template
- `realsense_project_template` - Object-oriented class for projects
- `demo_project_template()` - Comprehensive demo

## 🛠️ Project Structure

```
Camera/
├── +realsense/                    # RealSense package
│   ├── librealsense_mex.mexw64   # MEX file
│   ├── realsense2.dll            # SDK library
│   └── *.m                       # MATLAB wrappers
├── startup_camera_project.m      # Project startup script
├── test_realsense_setup.m        # Setup verification
├── simple_realsense_test.m       # Basic test
├── realsense_live_test.m         # Live streaming
├── realsense_color_depth_test.m  # Color + depth
├── realsense_distance_measurement.m # Distance measurement
├── realsense_3d_pointcloud.m     # 3D visualization
├── realsense_project_template.m  # Project template
├── demo_project_template.m       # Template demo
├── NEXT_STEPS_GUIDE.md          # Advanced guide
├── REALSENSE_README.md          # Setup guide
└── README.md                    # This file
```

## 🔧 Usage Examples

### Using the Project Template
```matlab
% Create instance
rs = realsense_project_template();

% Start streaming
rs.start_streaming();

% Get frames
[depth_img, color_img, depth_matrix] = rs.get_frames();

% Measure distance
distance = rs.measure_distance(x, y);

% Generate point cloud
[vertices, colors] = rs.get_pointcloud();

% Save frames
rs.save_frames('my_capture');

% Clean up
rs.stop_streaming();
```

### Interactive Distance Measurement
```matlab
realsense_distance_measurement()
% Click anywhere in the image to measure distance
```

### 3D Point Cloud
```matlab
realsense_3d_pointcloud()
% Generates and displays 3D point cloud
```

## 📚 Documentation

- `NEXT_STEPS_GUIDE.md` - Advanced applications and project ideas
- `REALSENSE_README.md` - Complete setup and troubleshooting guide

## 🎯 Next Steps

1. **Run the startup script** to initialize the project
2. **Test your camera** with the basic functions
3. **Explore advanced features** like 3D point clouds
4. **Build your own applications** using the project template

## 🔍 Troubleshooting

If you encounter issues:

1. **Check camera connection** - Ensure RealSense is connected via USB 3.0
2. **Run startup script** - `startup_camera_project()` sets up paths
3. **Test setup** - `test_realsense_setup()` verifies everything works
4. **Check documentation** - See `REALSENSE_README.md` for detailed troubleshooting

## 🎉 Ready to Start!

Your RealSense camera project is now organized and ready to use. Start with `startup_camera_project()` and then explore all the features!
