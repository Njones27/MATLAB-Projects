%{
EGR102MetricFlashCards - Test students' knowledge of metric prefixes
Authors:    Nathan Jones
Assignment: EGR 102-010 Stepper Motor
Changed:    1 November 2023
History:     None
Purpose:
 Makes an interactive flash card system to test student's metric prefix 
 knowledge
Notes: None
%}

clear;
clc;

% Gets data from excel sheet
data = readtable('metricPrefixes.xlsx');

% Creates a string array of names from the prefix column
prefixNames = string(data.prefix);

% Creates a string array of abbreviations from the abbreviation column
abbreviations = string(data.abbreviation);

% Creates a double array of exponents from the exponent column
exponents = double(data.exponent);

% Instantiate "correct" variables
numCorrectAbbrev = 0;
numCorrectExponent = 0;

% Prints the logo
fprintf("//----------------------\\");
fprintf("\n||  METRIC FLASH CARDS ||\n");
fprintf("\\----------------------//\n");

% Input number of prefixes to review
howMany = input("How many prefixes would you like to review?: ");

% Runs the flashcard system

for i=1:howMany % Instantiates for-loop

    % Selects a row to be tested
    rowNumber = randi(length(prefixNames));

    % Stores prefix name, abbreviation, and exponent
    % from the rowNumber-th row as variables
    prefixName = prefixNames(rowNumber);
    abbreviation = abbreviations(rowNumber);
    exponent = exponents(rowNumber);

    % Stores rowNumber in the rowNumberArray in  index (i) 
    % Note - wants to reallocate for speed, but error is non-vital
    rowNumberArray(i) = rowNumber;

    % Prints prefix name
    fprintf("The metric prefix is: %s\n", prefixName);

    % Gets the user abbreviation input and sets it to a string
    abbrevGuess = input("What is the abbreviation? ", "s");

    % Compares abbrevGuess and reports back if correct or incorrect,
    % if the guess is incorrect, display the correct answer.
    if abbrevGuess == abbreviation
        disp('Abbreviation is correct!');
        numCorrectAbbrev = numCorrectAbbrev + 1;
    else
        fprintf('The correct abbreviation is: %s', abbreviation);
    end

    % Gets the user exponent guess and sets it to a string
    exponentGuess = input("\nWhat is the exponent? ");

    % Compares exponentGuess and reports back if correct or incorrect,
    % if the guess is incorrect, displays the correct answer.
    if exponentGuess == exponent
        disp('Exponent is correct!');
        numCorrectExponent = numCorrectExponent + 1;
    else
        fprintf('The correct exponent is: %d', exponent);
    end

    % Pauses and skips 2 lines to set up next part of code
    pause (0.5);
    fprintf("\n\n");
end

% Displays a message if prefixes were tested, if they were, then a session 
% review is printed
if howMany <= 0
    fprintf("No prefixes were reviewed. ")
else
    percentACorrect = (numCorrectAbbrev/howMany)*100;
    percentECorrect = (numCorrectExponent/howMany)*100;
    fprintf("//-------------------------------------------\\\n");
    fprintf("|| SESSION REVIEW                            ||\n");
    fprintf("||-------------------------------------------||\n");
    fprintf("|| Number of Prefixes Reviewed:   %d          ||\n", howMany);
    fprintf("|| Correct Abbreviations:         %d (%5.1f%%) ||\n", numCorrectAbbrev, percentACorrect);
    fprintf("|| Correct Exponents:             %d (%5.1f%%) ||\n",numCorrectExponent, percentECorrect);
    fprintf("||-------------------------------------------||\n");
    fprintf("|| REVIEWED PREFIXES                         ||\n");
    fprintf("||-------------------------------------------||\n");
    for i=1:length(rowNumberArray)
        fprintf("|| %-5s %-2s  10^%-3d                          ||\n", prefixNames(rowNumberArray(i)), abbreviations(rowNumberArray(i)), exponents(rowNumberArray(i)));
    end
    fprintf("\\-------------------------------------------//\n\n");
end

% Thanks users for using the metric flash cards system
fprintf("Thank you for using Metric Flash Cards!\n");