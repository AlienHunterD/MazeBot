close all
clear all
clc

% test robot angle to voltage

% Setup Arduino
a = arduino();
forwardPin = ["D22"; "D24"; "D27"; "D28"; "D31"];
reversePin = ["D23"; "D25"; "D26"; "D29"; "D30"];
enablePin = ["D2"; "D3"; "D4"; "D5"; "D6"];
potVal = ["A0"; "A1"; "A2"; "A3"; "A4"];

%setup pin
ConfigureArduinoPin(a)

% User defined robot endeffector position
% A1user = 0/180*pi;
% A2user = 270/180*pi;
% A3user = 90/180*pi;
% A4user = 0/180*pi;

A1user = 17/180*pi
A2user = 20/180*pi
A3user = 80/180*pi
A4user = 20/180*pi

[X,Y,Z] = AngleToCoordinate(A1user,A2user,A3user,A4user)

% % Convert angle to voltage value
% [V1,V2,V3,V4] = AngleToVoltage(A1user,A2user,A3user,A4user)
% 
% % Drive robot to desired voltage value
% DriveMotor(a,1,V1) %
% DriveMotor(a,2,V2) 
% DriveMotor(a,3,V3) 
% DriveMotor(a,4,V4) 
% 
% T1_val = readVoltage(a,potVal(1))*1024/5
% T2_val = readVoltage(a,potVal(2))*1024/5
% T3_val = readVoltage(a,potVal(3))*1024/5
% T4_val = readVoltage(a,potVal(4))*1024/5