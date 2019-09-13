# deeplabcut_texteam
Pertinent code and documents for Hausser group DLC analysis

  ![alt text](https://pouch.jumpshare.com/preview/kkTqVaAUz4uHM7tu6KpKpxkbJg6ejO0dknNShcUkOU4LPFeE_cx4MKnHtk4pSvO7V8XUwix4sCliAF3y3w7PmRA1jQB_zmxltR5bgJ1-nls)


## Documentation

### \Code\Crop video\getCroppingDims.m
This script is intended to help determine the cropping dimensions to input before labelling.
Typically, the frame that DLC selects when you set the cropping parameter to True is one that doesn't capture the full reach of the whisker, and thus you are liable to select dimensions that will cut off the whisker at a crucial timepoint. I created this script to allow users to shuffle through frames until the full whisker trajectory is covered, and then make a selection while visualizing the frame. 
