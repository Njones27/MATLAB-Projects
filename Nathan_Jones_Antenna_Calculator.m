%{
EGR102AntennaCalculator - Calculates signal wavelength and optimum 
                          antenna length
Authors:    Nathan Jones
Assignment: EGR 102-010 Antenna Calculator
Changed:    11 September 2023
History:     None
Purpose:
 Calculate signal wavelength and optimum antenna lengeth for HASL LLC

Notes: None
%}

%Displays the HASL logo
disp("| ((|)) Handmade");
disp("|___|   Aerial");
disp("|   |   Solutions");
disp("|   |   LLC" )
fprintf("\n")

% Prompts the user for a frequency with the message "Enter the desired
% reception frequency in MHz: "
frequency_MHz = input("Enter the desired reception frequency in MHz: ");

% Converts frequency from MHz to Hz
frequency_Hz = frequency_MHz * 1.0e6;

% Calculates the wavelength of the signal
wavelength = (3e8/frequency_Hz);

% Calculates the optimum antenna length
Antenna_Length_Meters = ((0.95*wavelength)/2);

% Converts Antenna Length to inches
Antenna_Length_Inches = Antenna_Length_Meters * 39.37;

% Displays the signal wavelength in meters
fprintf("The signal wavelength is %.2f meters.\n", wavelength);

% Displays the antenna length in inches and meters
fprintf("The optimum antenna length is %.2f inches (%.2f meters).\n", Antenna_Length_Inches, Antenna_Length_Meters);

%{
    Testing: After testing with unsual values such as "0", "-0.7", and 
    "1/3", I discovered that negative numbers give negative outputs and
    acts normally. It also acts normally when I entered "1/3". 
    However, when "0" is entered, the program assumed it had an "infinite"
    wavelength and antenna length, which isn't correct. 
%}