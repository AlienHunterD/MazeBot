function DriveMotor(arduino,motorNumber,desVolt)

% % Index
% % M1 = 1;
% % M2 = 2;
% % M3 = 3;
% % M4 = 4;
% % GRIP = 5;

forwardPin = ["D22"; "D24"; "D27"; "D28"; "D31"];
reversePin = ["D23"; "D25"; "D26"; "D29"; "D30"];
enablePin = ["D2"; "D3"; "D4"; "D5"; "D6"];
potVal = ["A0"; "A1"; "A2"; "A3"; "A4"];

loopInt = 1;
% % drive motor to desired position
if (motorNumber == 1)
    while loopInt == 1
        difference = desVolt-readVoltage(arduino,potVal(1))*1024/5;
        if abs(difference) <= 8
            loopInt = 0;
        elseif (difference) > 8
            MoveMotorCounterClockWise(arduino,motorNumber)
           loopInt = 1;
        elseif (difference) < -8
            MoveMotorClockWise(arduino,motorNumber)
           loopInt = 1;
       end
    end
elseif (motorNumber == 2)
    while loopInt == 1
        difference = desVolt-readVoltage(arduino,potVal(motorNumber))*1024/5;
        if abs(difference) <= 8
            loopInt = 0;
        elseif (difference) > 8
            MoveMotorCounterClockWise1(arduino,motorNumber)
           loopInt = 1;
        elseif (difference) < -8
            MoveMotorClockWise1(arduino,motorNumber)
           loopInt = 1;
       end
    end
elseif (motorNumber == 3)
    while loopInt == 1
        difference = desVolt-readVoltage(arduino,potVal(motorNumber))*1024/5;
        if abs(difference) <= 8
            loopInt = 0;
        elseif (difference) > 8
            MoveMotorCounterClockWise2(arduino,motorNumber)
           loopInt = 1;
        elseif (difference) < -8
            MoveMotorClockWise2(arduino,motorNumber)
           loopInt = 1;
       end
    end
else
    while loopInt == 1
        difference = desVolt-readVoltage(arduino,potVal(motorNumber))*1024/5;
        if abs(difference) <= 8
            loopInt = 0;
        elseif (difference) > 8
            MoveMotorCounterClockWise3(arduino,motorNumber)
           loopInt = 1;
        elseif (difference) < -8
            MoveMotorClockWise3(arduino,motorNumber)
           loopInt = 1;
       end
    end
end

end


