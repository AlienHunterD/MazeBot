function [a1_path,a2_path,a3_path,a4_path]=createAnglePathFromCoordinate(x1, x2, y1, y2, z1, z2)

xpath = linspace(x1,x2,60);
ypath = linspace(y1,y2,60);
zpath = linspace(z1,z2,60);

for i = 1:1:length(xpath)
    [a1_path(i),a2_path(i),a3_path(i),a4_path(i)]=CoordinateToAngle2(xpath(i),ypath(i),zpath(i));
end
end