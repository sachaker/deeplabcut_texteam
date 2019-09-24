## Labeling overview
- 2 whiskers, centrally located
- 6 nodes per whisker
- 1 model per session
- 200 frames per model, divided equally among the subsessions
- Whisker out of the frame?—Do NOT label!
- Keep the increment size between nodes fixed
- End of the whisker occluded?—label only as many nodes at fit with the increment size!

## Uncertain about the whisker position for a given frame?
1. Mark frame number down in 'Unsure Frames' column of *whisker_data_DLC.xls*
2. Run [getNeighboringFrames.m](https://github.com/sachaker/deeplabcut_texteam/blob/master/Code/Track%20whiskers/getNeighboringFrames.m) and check surrounding frames
3. Have a colleague check it for you
