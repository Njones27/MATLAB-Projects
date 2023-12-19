%{
EGR102DebuggingAProgramWithErrors - Debugs the Heat Transfer Program
Authors:    Nathan Jones
Assignment: EGR 102-010 Debugging a Program with Errors
Changed:    20 September 2023
History:     None
Purpose:
 Debugs the Heat Transfer Program and practice debugging skills

Notes: None
%}
% Initialize variables
ThermalConductivity= 0.3; % fire clay for a furnace wall in Watts/(meter*Kelvin)
TempInside = 650; % This is in C, which I can get away with because delta C = delta K
TempOutside = 150; % also in C
Thickness = 0.1524; % 6 inches in meters


% Corrections; corrected ThermalConductivity spelling, and made sure to 
% Multiply ThermalConductivity by the quantity instead of add, as well as 
% subtract TempInside and TempOutside
HeatTransferPerArea = (ThermalConductivity * (TempInside - TempOutside))/Thickness;

% Corrections: fprint needed to be fprintf, and variable name should be
% HeatTransferPerArea
fprintf("Heat transfer per area is %.2f Watts/square meter\n", HeatTransferPerArea);