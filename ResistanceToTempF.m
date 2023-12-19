function [TemperatureF] = ResistanceToTempF(resistance)
%RES2TEMP Calculate the temperature (in Kelvin) of the Parts Pal thermistor
%         from a measured resistance. Then convert that temp to Fahrenheit.
%   Based on a simplification of the Steinhart-Hart equation
%   The resistance argument may be either a scalar or an array.

    temp0 = 298.15; % reference temperature (25 C), in Kelvin
    res0 = 10000;   % resistance at reference temperature, in Ohms
    B = 3950;       % thermistor B parameter, in Kelvin

    % log(...) is natural logarithm (base e = 2.71828).
    % The second and third divisions, the logarithm, and the addition are
    % applied to the entire array at once.
    recip_temp = 1/temp0 + log(resistance/res0)/B;

    % Use ./ to apply this division to each element of the array. Without
    % the dot, MATLAB would try to find the inverse of a matrix instead.
    temperature = 1./recip_temp;
    
    % Convert Kelvin to Fahrenheit
    
    TemperatureF=((temperature -273.15)*1.8)+32;
end
