clear all
close all
clc

x1 = 14.7472;
x2 = 14.7472;
y1 = 5;
y2 = -5;
z1 = 15.1299;
z2 = 15.1299;

[a,b,c,d] = createAnglePathFromCoordinate(14.7472, 14.7472, 5, -5, 15.1299, 15.1299)
for i = 1:1:length(a)
plot_robot(a(i),b(i),c(i),d(i))
hold on
end
plot3(x1,y1,z1,'*')
plot3(x2,y2,z2,'s')