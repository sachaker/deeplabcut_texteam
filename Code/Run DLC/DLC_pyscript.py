 # move this file to \Anaconda3\envs\dlc-windowsGPU\Lib

# Modifications made by SM on 15.09.19

# todo list (things to automate)
	# make video list based on num_subsessions variable --- Done! (SM, 10.09.19)
	# set numframes2pick variable in .yaml file depending on num_subsessions --- Done! (SM, 10.09.19)
	# find out how to create the shortcut programmatically to fix the symbolic link hack --- Done! (SM, 10.09.19)

# to avoid running code when module is imported
def main():
    pass
	
###### Main ######
import deeplabcut, os
from datetime import datetime

mouse = input('Which mouse?: ') # cb107
date = input('Date? (YYYYMMDD): ') # 20170523
num_subsessions = int(input('How many subsessions?: ')) # 7


# prepare path variables
session_path_mouse = 'Z:\\data\\HS\\DLC\\' + mouse
session_path = 'Z:\\data\\HS\\DLC\\' + mouse + '\\' + date

# make directory if it does not exist yet
if not os.path.exists(session_path_mouse):
    print('folder does not exist')
    os.mkdir(session_path_mouse)
    print('created folder for mouse')
if not os.path.exists(session_path):
    print('folder does not exist')
    os.mkdir(session_path)
    print('created folder for session')
    
# navigate to the data directory
os.chdir(session_path)

# video paths that are part of the subsessions to be labelled
videoFiles = []
count = 0;
videoPath = 'Z:\\data\\HS\\avi\\' + mouse + '\\' + date
for r, d, f in os.walk(videoPath):
    for file in f:
        if (count == num_subsessions+1):
            break
        if '.avi' in file:
            videoFiles.append(os.path.join(r, file))
        count+=1
list.sort(videoFiles)
list.sort(f)

model_path = os.listdir(session_path)
    
now = datetime.now()
year = now.strftime("%Y")
month = now.strftime("%m")
day = now.strftime("%d")
	
labeler = input('What are the initials of the primary labeler?: ')

projectPath = session_path + '\\' + mouse + '-' + date + '-' + labeler + '-' + year + '-' + month + '-' + day 
	
totalFrames = 200
numframes = (totalFrames - (totalFrames % num_subsessions)) / num_subsessions
	
config_path = deeplabcut.create_new_project(mouse + "-" + date, labeler, videoFiles) # just to be safe

# crop and select frames - this takes a little while for each subsession video
# make sure to have the video open to know how you want to crop
# open the .yaml file in text editor and change the numframes2pick to 200/num_subsessions
#####deeplabcut.extract_frames(config_path, crop=True)
# this puts the labeled frames into the labeled data subfolder

# label frames
#####deeplabcut.label_frames(config_path)

"""
# Rules
# 1. Open the subsession .avi video in VLC media player and move through frames to familiarise yourself with the whiskers
#(use "E" to move single frames)
# 2. 
# 1. Don't label if you don't know!

# if unsure - label in the way you think makes most sense. and then put the frame id into the excel
# check labels to make them smaller
"""

# when you are done - save out pictures of the labeled frames
#####deeplabcut.check_labels(config_path)




