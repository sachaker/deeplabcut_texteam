# DeepLabCut - Tex Team
Pertinent code and documents for Hausser Lab DLC analysis

  ![alt text](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/Images/whiskers.gif)


## What's new
- Created protocol for refining labels
- Built new labeling system


## Repository overview

### Protocols \ [refineLabelsProtocol.md](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/refineLabelsProtocol.md)
A protocol for retraining DLC networks.

### Protocols \ [alternateLabelingGUI.md](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/alternateLabelingGUI.md)
Gives a brief overview of the new labeling GUI, developed to expedite the labeling process.

### Protocols \ [trainingProtocol.md](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/trainingProtocol.md)
Modifications to be made to pose_cfg.yaml for each DLC model. Variables are optimized to expedite convergence of the models. Data supporting the step sizes are also found here

### Protocols \ [labelingProtocol.md](https://github.com/sachaker/deeplabcut_texteam/tree/master/Protocols/labelingProtocol.md)
Main guidebook for the labeling process and an attempt to codify some of the principles learned from past models.

### Protocols \ [runningDLC.md](https://github.com/sachaker/deeplabcut_texteam/tree/master/Protocols/runningDLC.md)
Simple protocol for running DLC pipeline.
Shows how to create a project from scratch and goes through a few of the other functions in DLC.

### Protocols \ [runningDLC_Walkthrough.md](https://github.com/sachaker/deeplabcut_texteam/tree/master/Protocols/runningDLC_Walkthrough.md)
This is for those who find it easier to follow than just blindly running the script. Feel free to copy and paste! Please note that this pipeline was written to navigate through our current directory structure, which is bound to change in the future (or will be different for users outside our group). In other words, this How-To is not meant to be prescriptive, but rather a rough guideline for users unfamiliar with the DLC process.

### Code \ Run DLC \ [DLC_pyscript.py](https://github.com/sachaker/deeplabcut_texteam/blob/master/Code/Run%20DLC/DLC_pyscript.py)
Main script for creating a new project in DLC.
Functionality includes: simple interface for user input, number of frames to extract is updated programmatically, automated creation of folders for each video in session.

### Code \ Run DLC \ [new.py](https://github.com/sachaker/deeplabcut_texteam/blob/master/Code/Run%20DLC/new.py)
Modified script from DLC library, allowing for the various functionalities of DLC_pyscript.py. 

### Code \ Crop video \ [getCroppingDims.m](https://github.com/sachaker/deeplabcut_texteam/blob/master/Code/Crop%20video/getCroppingDims.m) 
This script is intended to help determine the cropping dimensions to input before labeling.
Typically, the frame that DLC selects when you set the cropping parameter to True is one that doesn't capture the full reach of the whisker, and thus you are liable to select dimensions that will cut off the whisker at a crucial timepoint. I created this script to allow users to shuffle through frames until the full whisker trajectory is covered, and then make a selection while visualizing the frame. 

### Code \ Track whiskers \ [getNeighboringFrames.m](https://github.com/sachaker/deeplabcut_texteam/blob/master/Code/Track%20whiskers/getNeighboringFrames.m) 
This script is for situations where the user is labeling and cannot identify the whiskers from the given frame.
Despite the generally decent conditions of the hi-speed setup, it is inevitable that some frames will be inherently unlabelable, and thus visualizing the frames leading up to or following the current frame can be helpful in tracking those whiskers. See an example [here](https://github.com/sachaker/deeplabcut_texteam/blob/master/Code/Track%20whiskers/See%20an%20example/CLICK_ME.md).
