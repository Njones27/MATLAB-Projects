%{
EGR102Machine_Vision - Use MATLAB logic to determine the value of coins in an image
Authors:    Nathan Jones
Assignment: EGR 102-010 Machine Vision
Changed:    30 November 2023
History:    None
Purpose:
 Use MATLAB logic to determine the value of the coins in the image and 
 use MATLAB logic to determine the value of coins in an image

Notes: None
%}

% Set up coding space
clear;
clc;
close all;

% Read in the image
image = imread('CoinsOnGreen.jpg');

% Show image on screen
imshow(image);

% Inspects image with (x,y) coordinates
imtool(image);

% Seperate RGB
r_channel = image(:,:,1);
g_channel = image(:,:,2);
b_channel = image(:,:,3);

% Create ratio tables
rg_ratio = double(r_channel./g_channel);
bg_ratio = double(b_channel./g_channel);

% Set NaN elements to zero
rg_ratio(isnan(rg_ratio)) = 0;
bg_ratio(isnan(bg_ratio)) = 0;

% Seperate coins from background
coins = rg_ratio > 0.5;             % Logical array
coinsBW = bwareaopen(coins,50);     % Cleanup black and white image
imshow(coinsBW);                    % Shows logical array image

% Find statistics of coin areas
stats = regionprops('table',coinsBW,'Centroid','ConvexArea','MajorAxisLength','MinorAxisLength');

UsefulTable = stats{:,:};           % Turns stats into an array

% Find radii from diameter
radii = UsefulTable(:,3)/2;

% Array for locations
centers = UsefulTable(:,1:2); 

% Show original image with circles overlaid on coins
figure
    imshow(image)
    hold on
    viscircles(centers, radii);
    hold off

% Exclude circles with too-large and too-small diameters
realCoins = UsefulTable(:,5) > 100 & UsefulTable(:,5) < 100000;
CoinTable = UsefulTable(realCoins,:);

% Determine distribution of coin diameters to identify value
figure
histogram(CoinTable(:,3),15);

% Assigns values to coins
penny = 0.01;
nickle = 0.05;
dime = 0.1;
quarter = 0.25;
change = 0;

% Loops through each coin in CoinTable, iterates by adding 1 each time
for i = 1:size(CoinTable,1)
    coinDiameter = CoinTable(i,3);

    % Determines the type of coin based on diameter from CoinTable
    if coinDiameter < 72
        amount = dime;
    elseif coinDiameter < 78
        amount = penny;
    elseif coinDiameter < 85
        amount = nickle;
    else
        amount = quarter;
    end

   % Updates the total amount
   change = change + amount;
end

fprintf("The value of the coins shown in the image is $%.2f", change);
