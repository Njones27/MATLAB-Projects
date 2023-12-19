%{
EGR102ErrorCheckingResistorCalculator - Checks if current is safe for LED
Authors:    Nathan Jones
Assignment: EGR 102-010 Error Checking Resistor Calculator
Changed:    14 September 2023
History:     None
Purpose:
 Calculates the current through an LED while checking whether the
 combination of resistors is safe for the LED.

Notes: None
%}

% Assigns variables
Vsource = 5;
Vled = 1.85;
LEDMaxVoltage = 30;

% Allows the user to input two resistor values in ohms
resistance1 = input("Enter the resistance of resistor 1 in ohms: ");
resistance2 = input("Enter the resistance of resistor 2 in ohms: ");

% Checks to see if resistance1 is negative, and converts accordingly
if resistance1 < 0
    disp("Negative resistance, reversing.");
    resistance1 = -resistance1;
end

% Checks to see if resistanc2 is negative, and converts accordingly
if resistance2 < 0
    disp("Negative resistance, reversing");
    resistance2 = -resistance2;
end

% Calculates the effective resistance by inputting the formula
Reff = (1/((1/resistance1) + (1/resistance2)));

% Calculates the current in amps
Current_Amps = (Vsource - Vled)/Reff;

% Converts current in amps to milliamps
Current_mA = Current_Amps * 1000;

% Checks whether the current is safe for the LED
if Current_mA > LEDMaxVoltage
    disp("WARNING: Unsafe Current.");
else
    disp("Current is safe.");
end

% Displays the current in milliamps
fprintf("%.4f milliamps.\n", Current_mA);


