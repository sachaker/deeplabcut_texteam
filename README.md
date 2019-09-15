# DeepLabCut - Tex Team
Pertinent code and documents for Hausser Lab DLC analysis

  ![alt text](https://pouch.jumpshare.com/preview/kkTqVaAUz4uHM7tu6KpKpxkbJg6ejO0dknNShcUkOU4LPFeE_cx4MKnHtk4pSvO7V8XUwix4sCliAF3y3w7PmRA1jQB_zmxltR5bgJ1-nls)

## What's new
- Added a guidebook for labeling


## Repository overview

### Code \ Crop video \ getCroppingDims.m
This script is intended to help determine the cropping dimensions to input before labeling.
Typically, the frame that DLC selects when you set the cropping parameter to True is one that doesn't capture the full reach of the whisker, and thus you are liable to select dimensions that will cut off the whisker at a crucial timepoint. I created this script to allow users to shuffle through frames until the full whisker trajectory is covered, and then make a selection while visualizing the frame. 

### Code \ Track whiskers \ getNeighboringFrames.m
This script is for situations where the user is labeling and cannot identify the whiskers from the given frame.
Despite the generally decent conditions of the hi-speed setup, it is inevitable that some frames will be inherently unlabelable, and thus visualizing the frames leading up to or following the current frame can be helpful in tracking those whiskers.

### Protocols \ labelingProtocol_ClickMe.md
Guidebook for the labeling process and an attempt to codify some of the principles learned from past models.

### Protocols \ runDLC_ClickMe.md
Step-by-step protocol for running DLC pipeline.
This is for those who find it easier to follow than just blindly running the script. Feel free to copy and paste! Please note that this pipeline was written to navigate through our current directory structure, which is bound to change in the future (or will be different for users outside our group). In other words, this How-To is not meant to be prescriptive, but rather a rough guideline for users unfamiliar with the DLC process.
