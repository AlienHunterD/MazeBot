function ConfigureArduinoPin(a,MxD1,MxD2,MxE,cpot)
% Configure Arduino Pin for Input or Output
for i = 1:length(cpot)
    configurePin(a,MxD1(i),'DigitalOutput');
    configurePin(a,MxD2(i),'DigitalOutput');
    configurePin(a,MxE(i),'DigitalOutput');
    configurePin(a,cpot(i),'AnalogInput');
end

end