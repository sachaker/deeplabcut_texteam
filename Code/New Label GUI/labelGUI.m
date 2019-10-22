function labelGUI(varargin)
% LABELGUI MATLAB code for labelGUI.fig
%      LABELGUI, by itself, creates a new LABELGUI or raises the existing
%      singleton*.
%
%      H = LABELGUI returns the handle to a new LABELGUI or the handle to
%      the existing singleton*.
%
%      LABELGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LABELGUI.M with the given input arguments.
%
%      LABELGUI('Property','Value',...) creates a new LABELGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before labelGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to labelGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help labelGUI

% Last Modified by GUIDE v2.5 22-Oct-2019 12:27:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @labelGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @labelGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before labelGUI is made visible.
function labelGUI_OpeningFcn(hObject, ~, handles, varargin)
% Choose default command line output for labelGUI
handles.output = hObject;

axes(handles.axes1);

global numNodes
global numWhiskers
global vidID
global labelFiles
global images
global i
global header
global names
global modelFolder
global coordsFinal;

imshow(strcat(images(i).folder,'\',images(i).name))
title([images(i).name(1:end-4) newline num2str(i) '/' num2str(length(images))])
set(handles.axes1,'Units','pixels');

% Show last inputted coordinates
hold on
scatter(coordsFinal(i,1:2:length(coordsFinal(i,:))),coordsFinal(i,2:2:length(coordsFinal(i,:))),'rx');

try 
    
    for j = 1:2
        
        hFH = imfreehand();
        % Get the xy coordinates of where they drew.
        coords = hFH.getPosition;
        % get rid of imfreehand remnant.
        delete(hFH);

        % Smooth for human error
        smoothingFactor = 5;
        coords = [smooth(coords(:,1),smoothingFactor),smooth(coords(:,2),smoothingFactor)];

        % Discretize line into numNodes
        nodes = interparc(numNodes, coords(:,1), coords(:,2));

        % Show results
        scatter(nodes(:,1),nodes(:,2),'mx');
        scatter(nodes(:,1),nodes(:,2),'mo');
        scatter(nodes(:,1),nodes(:,2),'m+');

        % Store data (yes, it's ugly and hacky but anyway...)
        if (j == 1)
            coordsFinal(i,1:2:2*length(nodes)) = nodes(:,1)';
            coordsFinal(i,2:2:2*length(nodes)) = nodes(:,2)';
        else
            coordsFinal(i,1+numWhiskers*numNodes:2:end) = nodes(:,1)';
            coordsFinal(i,2+numWhiskers*numNodes:2:end) = nodes(:,2)';
        end
    end

    % Create new file
    writetable(cell2table([header; [names num2cell(coordsFinal)]]),strcat(modelFolder,'\alternate-labels\',labelFiles(vidID).name,'\CollectedData_SM.csv'),'writevariablenames',0)

catch % In case user skips to next frame
end


% % Update handles structure
% guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = labelGUI_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    global i
    i = i-1;
    labelGUI()

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    global i
    i = i+1;
    labelGUI()
     
function figure1_DeleteFcn(hObject, eventdata, handles)

function guiCloseTest
      close all;
      hGui = MainGui;  % get the handle to the GUI
      hListener = addlistener(hGui,'Visible', 'PostSet',@guiVisibleCallback);
      doLoop = true;
      k      = 1;
      while doLoop
          fprintf('At iteration: %d\n',k);
          k = k + 1;
          % pause to allow loop to be interrupted
          pause(0.001);
      end
      
function guiVisibleCallback(hObject, eventdata)
      fprintf('Gui visible property has changed!\n');
      doLoop = false;
