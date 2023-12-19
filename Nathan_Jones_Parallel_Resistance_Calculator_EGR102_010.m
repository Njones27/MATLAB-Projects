%{
EGR102ParallelResistorCalculator - Calculates resistance equivalence
Authors:    Nathan Jones
Assignment: EGR 102-010 Parallel Resistor Calculator
Changed:    1 September 2023
History:     None
Purpose:
 Practice MATLAB skills and Calculates resistance equivalance based on inputs given by the user

Notes: None
%}

%Allows the user to input two resistor values in ohms
resistance1 = input("Enter the resistance of resistor 1 in ohms: ");
resistance2 = input("Enter the resistance of resistor 2 in ohms: ");

%Calculates the resistance equivalence by inputting the formula used to
%calculate effective resitance or resistance equivalence
resistanceEquivalence = (1/((1/resistance1) + (1/resistance2)));

%Displays the resistance equiivalence based on the user-inputted values
disp("Resistance Equivalence: " + resistanceEquivalence)

