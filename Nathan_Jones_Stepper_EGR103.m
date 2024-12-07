clc;
clear;
clear s;
s = serialport('COM3', 9600);
% pause(2);
% distance = 2052*3; % this equals 6156
% write(s,int2str(distance),'string');
% 
 pause(3);  
% 
% distance = -2052*3;
% write(s,int2str(distance),'string')


% Start
distance = 6156/2;
write(s,int2str(distance), 'string');  % Goes to first output
pause (10);

distance = -(6156/2);
write(s,int2str(distance), 'string');  % Goes back to input
pause (10);

distance = 6156;
write(s,int2str(distance), 'string');  % Goes to 2nd output
pause (15);

distance = -(6156);
write(s,int2str(distance), 'string');  % Goes back to input
pause (15);

distance = -6156/2;
write(s,int2str(distance), 'string');  % Goes to 3rd output
pause (10);

% OPTIONAL IF REQUIRED - Turns back to input to end
distance = 6156/2;
write(s,int2str(distance), 'string');  % Goes back to input
pause (10);

