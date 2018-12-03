function [X,Y,Z] = AngleToCoordinate(t1,t2,t3,t4)

%%% Do Not Edit, FINAL


% Define link length
r1 = 0;
r2 = 9; % distance from base to motor 3
r3 = 11; % distance between motor 3 to motor 4
r4 = 11; % distance between motor 4 to led% r4 = 0;
% r4 = 0;

% Forward Kinematics

% Define alpha angles
a1 = -1*pi/2;

% Transformation matrix of gripper from base (T04)
T4 = [cos(t1)*cos(t2+t3+t4) -1*cos(t1)*sin(t2+t3+t4) -1*sin(t1) cos(t1)*(r2*cos(t2)+r3*cos(t2+t3)+r4*cos(t2+t3+t4));...
    sin(t1)*cos(t2+t3+t4) -1*sin(t1)*sin(t2+t3+t4) cos(t1) sin(t1)*(r2*cos(t2)+r3*cos(t2+t3)+r4*cos(t2+t3+t4));...
    -sin(t2+t3+t4) -cos(t2+t3+t4) 0 -r2*sin(t2)-r3*sin(t2+t3)-r4*sin(t2+t3+t4);...
    0 0 0 1];

X = T4(1,4);
Y = T4(2,4);
Z = T4(3,4);


end