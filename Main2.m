clc, clear, close all; 
b = arduino(); %set arduino to variable b

%Define Arduino pin variables
ledE = 'D3'; 
ledD1 = 'D42';
ledD2 = 'D44';

MxD1 = ["D22"; "D26"; "D30"; "D34"; "D38"];
MxD2 = ["D24"; "D28"; "D32"; "D36"; "D40"];
MxE =  ["D10"; "D11"; "D9"; "D6"; "D5"];
cpot = ["A8"; "A9"; "A10"; "A11"; "A12"];

%Set Direction for LED
writeDigitalPin(b,ledD1,1);
writeDigitalPin(b,ledD2,0);

%Configure Motor Pins
ConfigureArduinoPin(b,MxD1,MxD2,MxE,cpot);

%  Angle = [0,0,0,0,45];
%  Power = [0,1,1,1,0.7];
%  direct = [0,0,0,0,0];

% Move = [0,5,10,30,20,  0,1,1,1,1,   0,0,1,1,0;
%         0,0,10,0,0,  0,1,1,1,1,   0,1,1,0,1;
%         0,0,0,5,10,  0,1,1,1,1,   0,1,0,1,1;
%         0,30,0,0,25,  0,1,1,1,1,   0,0,1,0,1];
    
% Move = [0,0,0,0,1,  0,0.6,0.6,0.6,0.6,   0,0,1,1,0];
% Move = [0,10,10,0,20,  0,0.7,1,1,0.6,   0,1,0,1,1];
% Move = [0,0,2,0,0,  0,1,1,1,0.75,   0,0,0,0,1;
%         0,0,0,0,1,  0,1,1,1,0.75,   0,0,0,0,1;
%         0,0,3,0,0,  0,1,1,1,0.75,   0,0,1,0,1;
%         0,0,0,0,3,  0,1,1,1,0.75,   0,0,1,0,1;
%         0,0,1,0,0,  0,1,1,1,0.75,   0,0,0,0,1;
%         0,0,0,0,2,  0,1,1,1,0.75,   0,0,0,0,0;
%         0,0,2,0,0,  0,1,1,1,0.75,   0,0,0,0,0;
%         0,0,0,0,3,  0,1,1,1,0.75,   0,0,0,0,1];

%Power = [1,1,1,1,1];
%[Angle,direct]=ChangeInAngle(b,0,0,0,0,cpot);
 
%MultiDrive(b,Angle,Power,direct,MxD1,MxD2,MxE,cpot);
 for i=1:size(Move,1)
     MultiDrive(b,Move(i,1:5),Move(i,6:10),Move(i,11:15),MxD1,MxD2,MxE,cpot)
 end

% Clear all variables
clear, close all

fprintf('ended');