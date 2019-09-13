# Modifications made by SM on 10.09.19

# todo list (things to automate)
	# make video list based on num_subsessions variable --- Done! (SM, 10.09.19)
	# set numframes2pick variable in .yaml file depending on num_subsessions --- Done! (SM, 10.09.19)
	# find out how to create the shortcut programmatically to fix the symbolic link hack --- Done! (SM, 10.09.19)


# make sure you open Spyder within the DLC environment from the Anaconda navigator


# import deeplabcut - this takes a little while
import deeplabcut, os
from datetime import datetime

mouse = input('Which mouse?: ') # cb107
date = input('Date? (YYYYMMDD): ') # 20170523
num_subsessions = int(input('How many subsessions?: ')) # 7


# prepare path variables
session_path_mouse = 'Z:\\data\\HS\\DLC\\' + mouse
session_path = 'Z:\\data\\HS\\DLC\\' + mouse + '\\' + date

# make directory if it does not exist yet
if not os.path.exists(session_path):
    print('folder does not exist')
    os.mkdir(session_path)
    print('created folder')
if not os.path.exists(session_path_mouse):
    print('folder does not exist')
    os.mkdir(session_path_mouse)
    print('created folder')
    
# navigate to the data directory
os.chdir(session_path)

# os.getcwd() # to find the current path
#os.mkdir("Z:\\data\\HS\\DLC\\cb135\\20170821")

# video paths that are part of the subsessions to be labelled
# modified code from: https://www.mkyong.com/python/python-how-to-list-all-files-in-a-directory/
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
#f = f[0:(num_subsessions-1)] # get rid of thumbs.db if it exists

#create Project if it has not been created yet
model_path = os.listdir(session_path)
##if model_path:
    # just create the path to the config file
##    config_path = session_path+"\\"+model_path[0]+"\\config.yaml"
##else: # create a new project with folders
    
    ## NEED TO CHANGE IN CASE PROJECT FILE IS ALREADY THERE
now = datetime.now()
year = now.strftime("%Y")
month = now.strftime("%m")
day = now.strftime("%d")
	
labeler = input('What are the initials of the primary labeler?: ')

#Z:\data\HS\DLC\cb107\20170523\cb107-20170523-SM-2019-09-11
projectPath = session_path + '\\' + mouse + '-' + date + '-' + labeler + '-' + year + '-' + month + '-' + day 

#if not os.path.exists(projectPath):
#    print('project folder does not exist')
#    os.mkdir(projectPath)
#    os.mkdir(projectPath + '\\videos')
#    print('created project folder')
	
	
totalFrames = 200
numframes2pick = (totalFrames-(totalFrames%num_subsessions))/num_subsessions
print('Number of frames to extract per video is ' + str(numframes2pick))

###create symlinks	
##for i in range(num_subsessions):
	##dst = projectPath + '\\videos\\' + f[i]
    ##os.symlink(videoFiles[i], dst)

#####config_path = deeplabcut.create_new_project(mouse + "-" + date, labeler, videoFiles[0]) # just to be safe
#####for i in range(num_subsessions):
#####    deeplabcut.add_new_videos(config_path, [videoFiles[i]]) # should create synlinks for each

#create symbolic link for videos (NOT NECESSARY SINCE videoFiles IS A LIST AND STORES ALL VIDEOS AS SYMLINKS)
##for i in range(num_subsessions):
##	dst = config_path[0:-11] + "\\Videos\\" + f[i]
##	os.symlink(videoFiles[i], dst)

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


