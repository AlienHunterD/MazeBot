clear all
close all
clc

% This code takes in X Y Z coordinate values defined by user, calculate the
% desired angle, calculate the required voltage, then move robot to desired
% position

% Setup Arduino
arduinoObject = arduino();
forwardPin = ["D22"; "D24"; "D27"; "D28"; "D31"];
reversePin = ["D23"; "D25"; "D26"; "D29"; "D30"];
enablePin = ["D2"; "D3"; "D4"; "D5"; "D6";"D7"];
potVal = ["A0"; "A1"; "A2"; "A3"; "A4"];

%setup pin
ConfigureArduinoPin(arduinoObject)

% Initial Position
A1user = 10/180*pi;
A2user = 200/180*pi;
A3user = 45/180*pi;
A4user = 30/180*pi;

% Convert angle to voltage value
[V1,V2,V3,V4] = AngleToVoltage(A1user,A2user,A3user,A4user)

% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V4) 

% %setup camera
% CameraObject = imaqhwinfo
% [camera_name, camera_id, format] = getCameraInfo(CameraObject)
% vid = videoinput(camera_name, camera_id, format)
% set(vid, 'FramesPerTrigger', Inf)
% set(vid, 'ReturnedColorspace', 'rgb')
% vid.FrameGrabInterval = 5
% start(vid);
% data = getsnapshot(vid);
% imshow(data)
% stop(vid);
% flushdata(vid);
% 
[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, 5, 2, 12.5, 12.5);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end

[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, 2, 0, 12.5, 12.5);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end

[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, 0, 0, 12.5, 10);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end

[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, 0, -6, 10, 10);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end

[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, -6, -6, 10, 9);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end

[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, -6, -4, 9, 9);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end

[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, -4, -4, 9, 7);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end

[a1Path,a2Path,a3Path,a4Path] = createAnglePathFromCoordinate(17, 17, -4, -6, 7, 7);
for i = 1:1:length(a1Path)
[V1,V2,V3,V4] = AngleToVoltage(a1Path(i),a2Path(i),a3Path(i),a4Path(i));
% Drive robot to desired voltage value
DriveMotor(arduinoObject,1,V1) %
DriveMotor(arduinoObject,2,V2) 
DriveMotor(arduinoObject,3,V3) 
DriveMotor(arduinoObject,4,V3) 
end
% 
% % T1_val = readVoltage(arduinoObject,potVal(1))*1024/5
% % T2_val = readVoltage(arduinoObject,potVal(2))*1024/5
% % T3_val = readVoltage(arduinoObject,potVal(3))*1024/5
% % T4_val = readVoltage(arduinoObject,potVal(4))*1024/5
% % 
% % 
