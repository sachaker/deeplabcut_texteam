%% Get Neighboring Frames
% used for DLC, where whisker identification is uncertain
% Sacha McElligott
% 09.09.2019

%% Initialization
close all; clear all; clc;

%% Select data to pull
pathRoot = 'Z:\data\HS\avi\';
mouse = input('Which mouse?: ','s');
path = strcat(pathRoot,mouse);

files = dir(path);
alphabet = lower('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
for i = 3:length(files)
    disp(' ')
    disp(strcat(num2str(i-2),') ',files(i).name));
    videoFiles = dir(strcat(path,'\',files(i).name,'\*.avi'));
    for j = 1:length(videoFiles)
        disp(['    ' alphabet(j) ') ' videoFiles(j).name])
    end
end
n = input(['Which data would you like to analyze? (ex: 3b)' newline '--> '],'s');

%% Pull data
if length(n) > 2
    c = 1;
    dateID = str2num(n(1:2))+2;
else
    c = 0;
    dateID = str2num(n(1))+2;
end
for i = 1:length(alphabet)
    if strcmp(alphabet(i),n(c+2))
        videoID = i;
    end
end

videoFiles = dir(strcat(path,'\',files(dateID).name,'\*.avi'));
global obj;
obj = VideoReader(strcat(path,'\',files(dateID).name,'\',videoFiles(videoID).name));

numFrames = obj.Duration*obj.FrameRate;

global frameID;
frameID = input(['Which frame number? (max = ' num2str(numFrames) '): ']);

%% Display data
trackWhiskersGUI
