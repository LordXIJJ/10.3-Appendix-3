# RealSense SDK 2.0 for MATLAB Setup Guide

## Overview
This setup provides RealSense SDK 2.0 bindings for MATLAB, allowing you to use Intel RealSense cameras (D415, D435, etc.) directly in MATLAB.

## Files Included
- `+realsense/` - MATLAB package containing all RealSense bindings
  - `librealsense_mex.mexw64` - Compiled MEX file for Windows 64-bit
  - `realsense2.dll` - RealSense SDK 2.0 dynamic library
  - `*.m` files - MATLAB wrapper functions for RealSense API

## Setup Instructions

### 1. Prerequisites
- MATLAB R2017b or later
- Windows 10
- USB 3.0 port
- Intel RealSense camera (D415, D435, etc.)

### 2. Installation
The setup is already complete! The `+realsense` folder contains all necessary files.

### 3. Testing the Setup
Run the test script to verify everything is working:

```matlab
test_realsense_setup()
```

This will:
- Check if all required files are present
- Test if the RealSense bindings work
- Detect connected RealSense cameras
- Provide usage examples

### 4. Simple Test
To capture and display a depth frame:

```matlab
simple_realsense_test()
```

## Usage Examples

### Basic Depth Capture
```matlab
% Create pipeline and colorizer
pipe = realsense.pipeline();
colorizer = realsense.colorizer();

% Start streaming
profile = pipe.start();

% Wait for frames
fs = pipe.wait_for_frames();

% Get depth frame
depth = fs.get_depth_frame();
color = colorizer.colorize(depth);

% Convert to MATLAB format
data = color.get_data();
img = permute(reshape(data', [3, color.get_width(), color.get_height()]), [3 2 1]);

% Display
imshow(img);

% Stop streaming
pipe.stop();
```

### Available Examples
The `+realsense` package includes several example functions:

- `realsense.depth_example()` - Basic depth capture
- `realsense.capture_example()` - Color and depth capture
- `realsense.pointcloud_example()` - 3D point cloud generation
- `realsense.rosbag_example()` - Playback from rosbag files
- `realsense.depth_view_example()` - Advanced depth visualization

## Troubleshooting

### Common Issues

1. **"No RealSense devices found"**
   - Ensure camera is connected via USB 3.0
   - Check if camera is powered on
   - Try unplugging and reconnecting the camera

2. **"MEX file not found"**
   - Ensure `+realsense` folder is in your MATLAB path
   - Check that `librealsense_mex.mexw64` exists in the `+realsense` folder

3. **"DLL not found"**
   - Ensure `realsense2.dll` is in the same folder as the MEX file
   - Try restarting MATLAB after adding the DLL

4. **"Access violation" or crashes**
   - Ensure you're using a USB 3.0 port
   - Check if another application is using the camera
   - Try restarting MATLAB

### System Requirements
- Windows 10 (64-bit)
- MATLAB R2017b or later
- USB 3.0 port
- Intel RealSense camera (D415, D435, D410, D430, etc.)

## API Reference

### Main Classes
- `realsense.pipeline()` - Main streaming interface
- `realsense.config()` - Stream configuration
- `realsense.context()` - Device enumeration
- `realsense.colorizer()` - Depth visualization
- `realsense.pointcloud()` - 3D point cloud generation

### Common Methods
- `pipe.start()` - Start streaming
- `pipe.wait_for_frames()` - Wait for new frames
- `pipe.stop()` - Stop streaming
- `fs.get_depth_frame()` - Get depth frame
- `fs.get_color_frame()` - Get color frame

## Support
For more information, refer to:
- Intel RealSense SDK 2.0 documentation
- MATLAB documentation for MEX files
- RealSense community forums

## License
This setup uses Intel RealSense SDK 2.0, which is subject to Intel's license terms.
