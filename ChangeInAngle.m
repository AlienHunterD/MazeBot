function [Angle,direct] = ChangeInAngle(a,t1,t2,t3,t4,cpot)

Mxpoti = [0,0,0,0,0];
direct = [0,0,0,0,0];
Af = [0.0244,0.0488,0.0147,0.0186,0.0127];

%get pot values
for i = 1:length(cpot)
    Mxpoti(i) = readVoltage(a,cpot(i));
end

Mxpot = [Mxpoti(1),2.7+Af(2)*t4,2.58+Af(3)*t3,4-Af(4)*t2,1.94-Af(5)*t1];

Aval = Mxpoti - Mxpot;
Angle = abs(Aval./Af);

%Sets the direction for each motor
for i = 1:length(cpot)
    if(Aval(i) > 0)
        direct(i) = 1;
    else
        direct(i) = 0;
    end
end
direct(1) = ~direct(1);
direct(2) = ~direct(2);

end