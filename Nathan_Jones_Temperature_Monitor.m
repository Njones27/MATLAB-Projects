%{
EGR102TemperatureMonitor - Meaures voltage and resistance to measure temperature
Authors:    Nathan Jones
Assignment: EGR 102-010 Temperature Monitor
Changed:    28 September 2023
History:     None
Purpose:
 Measures temperature based on measuring voltage and resistance

Notes: None
%}
clc;
clear;
a = arduino();

% Assigns variables to use in while loop
    voltage = readVoltage(a, 'A0');
    vDivider = voltage;
    rTherm = VoltageToResistance(vDivider);
    resistance = rTherm;
    TemperatureF = ResistanceToTempF(resistance);
% Reads the voltage and resistance, and converts it to temperature, 
% then if temperature reaches above 85 degrees fahrenheit, then the LED
% will show, otherwise it will continuously read temperature

while TemperatureF <= 80
    voltage = readVoltage(a, 'A0');
    pause (2);
    vDivider = voltage;
    [rTherm] = VoltageToResistance(vDivider);
    resistance = rTherm;
    [TemperatureF] = ResistanceToTempF(resistance);
    fprintf("%f degrees F \n", TemperatureF);
    writeDigitalPin(a, 'D9', 0);

end
writeDigitalPin(a, 'D9',1);