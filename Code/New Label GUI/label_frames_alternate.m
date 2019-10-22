%% Alternative DLC Labeling GUI (faster!)
% 2019.10.21
% Sacha McElligott

%% Initialization
close all; clear all; clc;

%% Get user input
mouse = input('Which mouse? ','s');
date = input('Which date? ','s');
% cropParams = input('If there are crop params, please input them (e.g. 0,225,150,428): ','s'); % otherwise, hit enter
% try 
%     lims = str2double(regexp(cropParams,'\d*','match')');
% catch
%     lims = zeros(4,1);
% end

global numNodes;
global numWhiskers;
numNodes = 6;
numWhiskers = 2;

%% Get paths 
folder = strcat('Z:\data\HS\DLC\', mouse, '\', date);
files = dir(folder);
global modelFolder
modelFolder = strcat(folder,'\',files(3).name); % possible that there is more than one model, so please check this
global labelFiles
labelFiles = dir(strcat(modelFolder,'\labeled-data'));

%% Select video to label
for j = 3:length(labelFiles)
    disp([num2str(j-2) ') ' labelFiles(j).name]);
end
global vidID
vidID = 2 + input('Which video? ');

%% Load images
global images;
images = dir(strcat(labelFiles(vidID).folder, '\', labelFiles(vidID).name,'\*.png'));

%% NEW
% Initialize index and coords data
global i; i = 1;
global coordsFinal;

% Formatting stuff for CollectedData.csv
global names;
global header;
names = {};

for x = 1:length(images)
    names{end+1} = strcat('labeled-data\',labelFiles(vidID).name,'\',images(x).name);
end
names = names';

[~,header] = xlsread('Z:\data\HS\DLC\template.csv'); 

% Create directory to store data (so it doesn't overwrite DLC labels if you
% want to just test)
mkdir(strcat(modelFolder,'\alternate-labels\',labelFiles(vidID).name));

try 
    % Check for file
    coordsFinal = csvread(strcat(modelFolder,'\alternate-labels\',labelFiles(vidID).name,'\CollectedData_SM.csv'),3,1);
catch
    % Otherwise, initialize
    coordsFinal = zeros(length(images), numWhiskers*numNodes*2);
    writetable(cell2table([header; [names num2cell(coordsFinal)]]),strcat(modelFolder,'\alternate-labels\',labelFiles(vidID).name,'\CollectedData_SM.csv'),'writevariablenames',0)
  
end

% Run GUI
labelGUI();

%% File dependencies
% interparc.m
% template.csv
