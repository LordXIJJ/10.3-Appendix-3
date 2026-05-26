hwinfo = imaqhwinfo;
disp(hwinfo.InstalledAdaptors);

% info = imaqhwinfo('winvideo');
% disp(info.DeviceInfo);
% 
% 
info = imaqhwinfo('realsense');
disp(info.DeviceInfo);

% vid = videoinput('winvideo', 1, 'RGB_640x480');
% preview(vid);

% vid = videoinput('realsense', 1, 'RGB_640x480');
% preview(vid);
