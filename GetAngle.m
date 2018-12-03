function [t1,t2,t3,t4] = GetAngle(t1i,t2i,t3i,t4i,xi,yi,zi,x,y,z)

% Define link length

 r2 = 9; % distance from base to motor 3
 r3 = 11.5; % distance between motor 3 to motor 4
 r4 = 11; % distance between motor 4 to led
 
 Ox = xi - r4*cos(t1i)*cos(t2i+t3i+t4i); 
 Oy = yi - r4*sin(t1i)*cos(t2i+t3i+t4i);
 Oz = zi + r4*sin(t2i+t3i+t4i);

D = (Ox^2+Oy^2+Oz^2-r2^2-r3^2)/(2*r2*r3);

t1 = atan2(Oy,Ox);
t3 = atan2(sqrt(1-D^2),D);

alpha = atan2(r3*sin(t3), r2 + r3* cos(t3));
t2 = atan2(-Oz, sqrt(Ox^2+Oy^2)) - alpha;

t4 = - t3 - t2;

t1 = t1*180/pi;
t2 = t2*180/pi;
t3 = t3*180/pi;
t4 = t4*180/pi;
end