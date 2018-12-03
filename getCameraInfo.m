function [camera_name, camera_id, resolution] = getCameraInfo(a)
camera_name = char(a.InstalledAdaptors(1))
camera_info = imaqhwinfo(camera_name)
camera_id = 1;
resolution = char('YUY2_640x480');
end