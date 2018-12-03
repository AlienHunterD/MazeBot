function MultiDrive(a,Angle,power,direct,MxD1,MxD2,MxE,cpot)
%Function to drive all motors simultaneously when the inputs are
%angle difference, power, and direction of the motor. Other inputs are 
%Arduino pins for each motor and potentiometer.

%Create variables
Mxpot = [0,0,0,0,0];
Mxpot2 = Mxpot;

%Constant for converting from angles to voltage values
Af = [0.0244,0.0488,0.0147,0.0186,0.0127];

%Upper and lower voltage limits for each motors
limit1 = [3.42,1.1,0.49,1.22,0.49];
limit2 = [3.91,4.70,4.15,3.91,3.52];

%Check for motor direction
chck = [direct(1),direct(2),~direct(3),~direct(4),~direct(5)];

%Set Direction, get pot values, and set angles for each motor
for i = 1:length(cpot)
    Mxpot(i) = readVoltage(a,cpot(i));
    writeDigitalPin(a,MxD1(i), direct(i));
    writeDigitalPin(a,MxD2(i), ~direct(i));
    Af(i) = Af(i)*Angle(i);
end

%Variable to check if while loop is complete
loopit = power;

%loop until all motors has reached the desired angles
while (sum(loopit)> 0)
    
    for i = 1:length(cpot)
    Mxpot2(i) = readVoltage(a,cpot(i));
        if(abs(Mxpot(i)- Mxpot2(i)) >= Af(i)) %Check for angle change 
            loopit(i) = 0;
        elseif(Mxpot2(i) < limit1(i) && chck(i) == 0) %Lower limit check
            loopit(i) = 0; 
        elseif(Mxpot2(i) > limit2(i) && chck(i) == 1) %Upper limit check
            loopit(i) = 0;
        end
        writePWMDutyCycle(a,MxE(i),power(i)*loopit(i));%Drive a motor
    end
    
end

%stops all motors
for i = 1:length(cpot)
    writeDigitalPin(a,MxD1(i),0);
    writeDigitalPin(a,MxD2(i),0);
    writePWMDutyCycle(a,MxE(i),0);
end

end

   