function [voltageValue1,voltageValue2,voltageValue3,voltageValue4] = AngleToVoltage(angle1,angle2,angle3,angle4)

% Voltage Value (experimentally identified)
lim1  = [600 844 1101 995];
lim2 = [40 156 113 152];

lim1  = [647 862 1280 777];
lim2 = [72 142 100 5];

% Calculated Degree (experimentally identified)
% degree1 = [36.2538 250.3703 80.0832 29.5465];
degree1 = [1.5708 3.142 6.283 -0.7854];
degree2 = [-1.5708 6.2832 0 0.7854];

if angle4 < degree1(4)
    angle4 = angle4 + 2*pi;
elseif angle4 > degree2(4)
        angle4 = angle4 - 2*pi;
end

if angle3 > degree1(3)
    angle3 = angle3 - 2*pi;
elseif angle3 < degree2(3)
        angle3 = angle2 + 2*pi;
end

if angle2 < degree1(2)
    angle2 = angle2 + 2*pi;
elseif angle2 > degree2(2)
        angle2 = angle2 - 2*pi;
end


if angle1 > degree1(1)
    angle1 = angle1 - 2*pi;
elseif angle1 < degree2(1)
        angle1 = angle1 + 2*pi;
end



desiredAngle = [angle1 angle2 angle3 angle4]

for i=1:1:length(desiredAngle)
    coefficients = polyfit([lim1(i), lim2(i)], [degree1(i), degree2(i)], 1);
    a(i) = coefficients(1);
    b(i) = coefficients(2);
    voltage(i) = (desiredAngle(i) -b(i))/a(i);
end



voltageValue1 = round(voltage(1),0);
voltageValue2 = round(voltage(2),0);
voltageValue3 = round(voltage(3),0);
voltageValue4 = round(voltage(4),0);

end
