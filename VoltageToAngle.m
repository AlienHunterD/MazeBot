function [angle1,angle2,angle3,angle4] = VoltageToAngle(voltage1,voltage2,voltage3,voltage4)

% Voltage Value (experimentally identified)
lim1  = [600 844 1101 995];
lim2 = [40 156 113 152];

% Calculated Degree (experimentally identified)
% degree1 = [36.2538 250.3703 80.0832 29.5465];
degree1 = [1.5708 3.142 6.283 -0.7854];
degree2 = [-1.5708 6.2832 0 0.7854];

voltage = [voltage1 voltage2 voltage3 voltage4];

for i=1:1:length(voltage)
    coefficients = polyfit([lim1(i), lim2(i)], [degree1(i), degree2(i)], 1);
    a(i) = coefficients(1);
    b(i) = coefficients(2);
    angle(i) = voltage(i)*a(i)-b(i);
end



angle1 = round(angle(1),3);
angle2 = round(angle(2),3);
angle3 = round(angle(3),3);
angle4 = round(angle(4),3);

end
