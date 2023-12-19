%{
EGR102Mini-Project - Checks the resistance of an "unlabeled" resistor
Authors:    Nathan Jones
Assignment: EGR 102-010 Mini-Project
Changed:    16 November 2023
History:    Updated 11-29-2023, added comments to code
Purpose:
 Checks the resistance of an "unlabeled" resistor and gives physical output
 to a servo motor and LEDs

Notes: None
%}

% Instantiate objects & variables
clear;
clc;
a = arduino(); 
s1=servo(a,'D3','MinPulseDuration', 700e-6, 'MaxPulseDuration', 2300e-6); % Initialize servo
writePosition(s1, 0.5); % Zeroes the servo (in the middle to represent 0 ohms)

voltage = readVoltage(a, 'A0');
r1 = (((5*10000)/voltage)-10000);
UserInput = 1;  % Sets user input to run while loop

% Runs a loop that runs until user does not want to test any more resistors
while UserInput == 1
    voltage = readVoltage(a, 'A0'); % Reads voltage each time it loops
    if voltage < 0.25               % Tests if there is a resitor being tested
        writePosition(s1, 0.5);     % Zeroes the servo (in the middle to represent 0 ohms)
        % Asks the user if they want to test another resistor, if yes
        % then userInput stays at one, if not, userInput is set to 0
        % and loop ends
        testAnother = input("Would you like to test another resistor? ", "s");
        fprintf("\n");                                                        
        lowerTestAnother = lower(testAnother); % Sets input to all lowercase
        if lowerTestAnother == "yes"
            UserInput = 1;
        else
            UserInput = 0;
        end
    elseif voltage <= 1.69355               % Tests if voltage out is below 1.69355 volts
        writePosition(s1, 1);               % Sets servo to 47K ohm position
        r1 = (((5*10000)/voltage)-10000);   % Calculates the resistance of r1 
        if r1 <= 44650 || r1 >= 49350       % Tests whether r1 is within tolerance
            writeDigitalPin(a, 'D8', 1);    % If r1 is NOT in tolerance, turns on red LED
        else
            writeDigitalPin(a, 'D7', 1);    % Turns on green LED
        end
        testAnother = input("Would you like to test another resistor? ", "s"); % Repeated from line 33-40
        fprintf("\n");
        lowerTestAnother = lower(testAnother); % Sets input to all lowercase
        if lowerTestAnother == "yes"
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 1;                  % Loop continues
        else
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 0;                  % Loop ends
        end
    elseif voltage <= 3.53617 && voltage > 0 % Tests if voltage is above 0, but below 3.53617 volts
        writePosition(s1, 0.75);             % Sets servo to 10K ohm position
        r1 = (((5*10000)/voltage)-10000);    % Calculates the resistance of r1 
        if r1 <= 9500 || r1 >= 10500         % Tests whether r1 is within tolerance
            writeDigitalPin(a, 'D8', 1);     % If r1 is NOT in tolerance, turns on red LED
        else
            writeDigitalPin(a, 'D7', 1);     % Turns on green LED
        end
        testAnother = input("Would you like to test another resistor? ", "s"); % Repeated from lines 33-40
        fprintf("\n");
        lowerTestAnother = lower(testAnother); % Sets input to all lowercase
        if lowerTestAnother == "yes"
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 1;                  % Loop continues
        else
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 0;                  % Loop ends
        end
    elseif voltage <= 4.69697 && voltage > 0 % Tests if voltage is above 0, but below 4.69697 volts
        writePosition(s1, 0.25);             % Sets servo to 1K ohm position
        r1 = (((5*10000)/voltage)-10000);    % Calculates the resistance of r1 
        if r1 <= 950 || r1 >= 1050           % Tests whether r1 is within tolerance
            writeDigitalPin(a, 'D8', 1);     % If r1 is NOT in tolerance, turns on red LED
        else
            writeDigitalPin(a, 'D7', 1);     % Turns on green LED
        end
        testAnother = input("Would you like to test another resistor? ", "s"); % Repeated from lines 33-40
        fprintf("\n");
        lowerTestAnother = lower(testAnother); % Sets input to all lowercase
        if lowerTestAnother == "yes"
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 1;                  % Loop continues
        else
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 0;                  % Loop ends
        end
    else
        writePosition(s1, 0);               % Sets servo to 330 ohm position
        r1 = (((5*10000)/voltage)-10000);   % Calculates the resistance of r1
        if r1 <= 313.5 || r1 >= 346.5       % Tests whether r1 is within tolerance
            writeDigitalPin(a, 'D8', 1);    % If r1 is NOT in tolerance, turns on red LED
        else
            writeDigitalPin(a, 'D7', 1);    % Turns on green LED
        end
        testAnother = input("Would you like to test another resistor? ", "s"); % Repeated from lines 33-40
        fprintf("\n");
        lowerTestAnother = lower(testAnother);
        if lowerTestAnother == "yes"
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 1;                  % Loop continues
        else
            writeDigitalPin(a, 'D8', 0);    % Turns off red LED
            writeDigitalPin(a, 'D7', 0);    % Turns off green LED
            UserInput = 0;                  % Loop ends
        end
    end
end
disp("Thank you for using this system!");   % Sends a message to the command window
writePosition(s1, 0.5);                     % Zeroes the servo (in the middle to represent 0 ohms)



