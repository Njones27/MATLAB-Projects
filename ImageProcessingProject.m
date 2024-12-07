close all %Close all open windows except for the main MATLAB window
clear %Clear the workspace
clc %Clear the command window

% read in the image
original = imread("Cyan_Pink_Stickers.jpg");
% this will make your picture appear on the screen.
imshow(original);

% Use this tool to inspect your image
imtool(original);
%Use the imtool to look at various areas in the image and record the RGB
%values. In the example image, I looked at the cyan sticker, the pink
%sticker, the table, the background, the wood block, and the label on the
%wood block

r_channel=original(:,:,1);
g_channel=original(:,:,2);
b_channel=original(:,:,3);
RG_Ratio = double(r_channel)./double(g_channel); %Red/Green Ratio
RB_Ratio = double(r_channel)./double(b_channel); %Red/Blue Ratio
GB_Ratio = double(g_channel)./double(b_channel); %Green/Blue Ratio
RG_Ratio(isnan(RG_Ratio))=0; %If the Red/Green ratio is NaN, set it to 0
RB_Ratio(isnan(RB_Ratio))=0; %If the Red/Blue ratio is NaN, set it to 0
GB_Ratio(isnan(GB_Ratio))=0; %If the Green/Blue ratio is NaN, set it to 0

%It was found that an RG_Ratio >= 2.0 indicates the pink sticker. an
%RB_Ratio >= 0.5 & <= 0.8 indicates the cyan sticker
%The | symbol indicates OR
%The & symbol indicates AND
bin=((RG_Ratio >= 2.0) | (RB_Ratio >= 0.5 & RB_Ratio <= 0.8));
% Do an imshow() of bin and see what the ratios reveal
imshow(bin);

% This gets rid of noise and turns the logical array into an image
black_and_white=bwareaopen(bin,5000); 
% gets rid of object smaller than 5000 pixels % in area. 
% Remember that 5000 is an arbitrary number and can be varied
% Now lets see what we have
imshow(black_and_white)

Bounding_Boxes = regionprops('table',black_and_white, 'BoundingBox'); %Makes a
bounding %box table
Bounding_Boxes = Bounding_Boxes{:,:}; %Converts table to array
figure, imshow(original),title('Bounding Box Around Blue Liqud')
hold on
for k = 1:size(Bounding_Boxes,1) % for k = 1:# of rows in Bounding_Box array
Sticker_Bounding = Bounding_Boxes(k,:);
rectangle('Position',Sticker_Bounding,'EdgeColor','r','LineWidth',2) %Plots boxes
end
hold off

Sticker_Width_Inch = 3; % The width of the sticker is 3 inches
%We know the actual width of the sticker and the width of the sticker in pixels
%(from the bounding box)
%We have two bounding boxes to choose from to get our ratio. However, the
%bounding box in Row 1 (the box around the pink sticker) is more closely
%aligned with the sticker, meaning we'll get a more accurate measurement
%using that box vs the box around the cyan sticker (which is askew). So,
%we'll use the information for the first bounding box to get our pixel
%width.
Sticker_Width_Pixels = Bounding_Boxes(1,3); %Width of sticker in pixels
%Make a conversion factor between pixels and distance
Ratio_inch = Sticker_Width_Inch/Sticker_Width_Pixels; %Gives us cm/pixel
Ratio_mm = Ratio_inch*25.4; %There are 25.4 mm in an inch
fprintf('The Ratio of Pixels to Distance is %f inches/pixel or %f mm/pixel\n',Ratio_inch, Ratio_mm);

% The following code will open the image of interest and allow you to click
% and drag a box over your Region of Interest (ROI) (where the text is). Once you
create the
% box over your ROI, just close the image.
imshow(original);
ROI = round(getPosition(imrect));

Read_ID = ocr(original,ROI);
ID = Read_ID.Text;
fprintf('The Read ID was: %s \n',ID);


