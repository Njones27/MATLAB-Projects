%{
EGR102StepperMotor - Moves a stepper motor in both directions
Authors:    Nathan Jones
Assignment: EGR 102-010 Stepper Motor
Changed:    1 November 2023
History:     None
Purpose:
 Moves a stepper motor in both directions
Notes: None
%}

clear;
clc;


a = arduino(); % Initializes arduino
stepsPerRevolution = 2048; %  initializes the stepper motor

% Instantiates the stepper motor
thisStepper = StepperRevA(a,stepsPerRevolution,'D8', 'D9','D10','D11');

% Moves the stepper motor clockwise one quarter revolution
MoveClockWise(thisStepper,100, stepsPerRevolution / 4);

% Moves the stepper motor back to original location
MoveCounterClockWise(thisStepper, 100, stepsPerRevolution / 4);

disp('program is done');
