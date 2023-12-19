%{
EGR102VoltageToResistance - Converts from voltage to resistance
Authors:    Nathan Jones
Assignment: EGR 102-010 Voltage to Resistance function
Changed:    28 September 2023
History:     None
Purpose:
 This function converts from voltage (V) to resistance (ohms)

Notes: None
%}

function [rTherm] = VoltageToResistance(vDivider)
% VoltagetoResistance takes measured voltage from voltage divider and 
% calculates resistance of thermistor
rTherm = ((5-vDivider)/(vDivider/10000));
end