# Running DeepLabCut

### 1. Run Command Prompt as Admin

### 2. Activate DLC and bypass access restrictions to Z: drive
```
cd \Users\tex_analysis\Desktop
activate dlc-windowsGPU
net use Z:
net use Y:
Z:
```

### 3. Run script
```
python Y:\student_folders\Sacha\Code\DLC_pyscript.py
```

#### All done! *Note*: while this is all you need to create a project in DLC, if you want a look under the hood of this program, click [here](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/runningDLC_Walkthrough.md). Keep scrolling if you want to see the various functions in DLC. If you are going to use these functions after calling the protocol above, please run `ipython` and `import deeplabcut`, and assign the right path to the variable config_path. Also, please note that you must still create the symlinks manually in \videos folder of the project path!

# Functions in DeepLabCut

### Extracting frames
###### This function will create frames for each video in \videos. If you are using my modified scripts, then the number of frames that are extracted will be preset by the number of subsessions you have for that animal. The function's default settings are to extract frames that cover a large distribution of the feature space of the video. For more information, see the original documentation by the Mathis group [here](https://github.com/AlexEMG/DeepLabCut/blob/master/docs/functionDetails.md#c-data-selection). 

```python
deeplabcut.extract_frames(config_path)
```
![alt_text](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/Images/extract_frames.PNG)

### Labeling frames
###### Loads the labeling GUI, which is pretty self-explanatory. Right-click to create a dot, left-click to move it. More info [here](https://github.com/AlexEMG/DeepLabCut/blob/master/docs/functionDetails.md#d-label-frames).  

```python
deeplabcut.label_frames(config_path)
```
![alt_text](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/Images/label_frames.PNG)

### Checking labels
###### This function saves labeled frames as images, and is especially helpful when there are multiple frames you are unsure of. I'm considering developing a mini-library of my own functions for DLC, and among them is only extracting unsure frames (calculated by either DLC or by those the user has inputted in the Google Sheets file).

```python
deeplabcut.check_labels(config_path)
```
![alt_text](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/Images/check_labels.png)

