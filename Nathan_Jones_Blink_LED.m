%{
EGR102BlinkLED - Calculates resistance equivalence
Authors:    Nathan Jones
Assignment: EGR 102-010 Blink LED
Changed:    7 September 2023
History:     None
Purpose:
 Practice MATLAB skills and makes an LED blink 10 times, brighten, as well
 as dim

Notes: None
%}

%Clears the workspace
clear;

%Connect_Arduino();
a = arduino();

%Makes the LED blink 10 times
for i = 1:10                        %Executes the for-loop 10 times
    writeDigitalPin(a, "D9", 1);    %Turn on LED
    pause(0.5);                     %Wait for half a second
    writeDigitalPin(a, "D9", 0);    %Turn off LED
    pause(0.5);                     %Wait for half a second
end                                 %Repeat until i>10

%Reports to the user that the program has ended
disp("Done");



%Creates 20 steps for incrementing from 0 (OFF) to 1 (ON)
brightness_step = (1-0)/20;

%Brightens the LED
for i = 1:20
    writePWMDutyCycle(a, "D9", i*brightness_step);
    pause(0.1);
end

%Dims the LED
for i = 1:20
    writePWMDutyCycle(a, "D9", 1-i*brightness_step);
    pause(0.1);
end

%Reports to the user that the program has ended
disp("Done");