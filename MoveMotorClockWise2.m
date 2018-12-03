function MoveMotorClockWise2(a,motorNumber)

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


writePWMDutyCycle(a,enablePin(motorNumber),0.8);
writeDigitalPin(a,forwardPin(motorNumber),0);
writeDigitalPin(a,reversePin(motorNumber),1);
pause(0.2);
StopMotor(a,motorNumber);

    
end