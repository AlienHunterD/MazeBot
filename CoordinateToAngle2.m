function [theta1,theta2,theta3,theta4] = CoordinateToAngle2(x,y,z)
%%% Do Not Edit, FINAL


% Define link length
r1 = 0;
r2 = 9; % distance from base to motor 3
r3 = 11; % distance between motor 3 to motor 4
r4 = 11; % distance between motor 4 to led% r4 = 0;
% t4 = 0;

theta1 = atan2(y,x);
% Ox = x - r4*cos(theta1)*cos(t2+t3+t4);
% Oy = y - r4*sin(theta1)*cos(t2+t3+t4);
% Oz = z + r4*sin(t2+t3+t4);


Ox = x - r4*cos(theta1);%*cos(t2+t3+t4);
Oy = y - r4*sin(theta1);%*cos(t2+t3+t4);
Oz = z;% + r4*sin(t2+t3+t4);
beta = 0; % approach angle for the hand with respect to horizontal (and in the plane defined by x1 and y1)
D = ((Ox^2+Oy^2+Oz^2)-r2^2-r3^2)/(2*r2*r3);

% First solution
% theta1 = atan2(Oy,Ox)
theta3 = atan2(sqrt(1-D^2),D);
theta2 = atan2(Oz,sqrt(Ox^2+Oy^2))-atan2((r3*sin(theta3)),(r2+r3*cos(theta3)))+pi;

dr = sqrt(Ox^2+Oy^2);
dz = Oz;
h = sqrt(dr^2+dz^2);
D1 = (r2^2+h^2-r3^2)/(2*r2*h);
psi = atan2(sqrt(1-D1^2),D1);
b = atan2(dr,dz);
theta2 = pi/2 + b - psi +pi;

theta4 =  2*pi + beta - theta2 - theta3;
% theta4_2 = pi + beta - theta2 - theta3;

end
