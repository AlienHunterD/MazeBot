function graph = plot_robot(t1,t2,t3,t4)
%robot parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r1 = 0;
r2 = 9; % distance from base to motor 3
r3 = 11; % distance between motor 3 to motor 4
r4 = 11; % distance between motor 4 to led% r4 = 0;

% alpha angles
a1 = -1*pi/2;
a2 = 0;
a3 = 0;
a4 = 0;

% height of base platform
L1 = 0;

% offset
d1 = 0;
d2 = 0;
d3 = 0;
d4 = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0 = 0;
y0 = 0;
z0 = 0;

A1 = Amatrix(r1,d1,a1,t1);
A2 = Amatrix(r2,d2,a2,t2);
A3 = Amatrix(r3,d3,a3,t3);
A4 = Amatrix(r4,d4,a4,t4);

T1 = A1;
T2 = A1*A2;
T3 = A1*A2*A3;
T4 = A1*A2*A3*A4;

X_coor = [T1(1,4) T2(1,4) T3(1,4) T4(1,4)];
Y_coor = [T1(2,4) T2(2,4) T3(2,4) T4(2,4)];
Z_coor = [T1(3,4) T2(3,4) T3(3,4) T4(3,4)];

graph = plot3(X_coor,Y_coor,Z_coor,'linewidth',2);
grid on;
rotate3d on; 
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('z coordinate');

end