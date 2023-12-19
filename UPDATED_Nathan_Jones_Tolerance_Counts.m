%{
EGR102ToleranceCounts - Gives a report for Mega-Size Hunger Bars
Authors:    Nathan Jones
Assignment: EGR 102-010 Tolerance Counts
Changed:   6 October 2023
History:   5 October 2023
Purpose:
 Practie skils in arrays and show a report listing the number of 
 underweight/overwight items, and the total of those items

Notes: None
%}


% Assign variables
nominalWeight = 4.13; % ounces
weightTolerance = 0.25; % ounces
minWeight = nominalWeight - weightTolerance;
maxWeight = nominalWeight + weightTolerance;
weightsSpreadsheet = readmatrix('Week7Weights.xlsx');
numData = length(weightsSpreadsheet);
first = weightsSpreadsheet(1);
last = weightsSpreadsheet(end);
overweight = weightsSpreadsheet > maxWeight;
underweight = weightsSpreadsheet < minWeight;
num_over = sum(overweight);
num_under = sum(underweight);
percent_over = 100 * (num_over / numData);
percent_under = 100 * (num_under / numData);

% Prints first and last weights
fprintf("First weight: %.2f  Last weight: %.2f \n", first, last);

% Prints the number of weights are overweight and underweight, and the
% percentage of the number compared to the total
fprintf("Underweight (< %.2f oz) items: %.0f (%.2f %%) \n", minWeight, num_under, percent_under);
fprintf("Overweight (> %.2f oz) items: %.0f (%.2f %%) \n", maxWeight, num_over, percent_over);
