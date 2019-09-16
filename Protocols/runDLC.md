# Running DeepLabCut

### 1. Run Command Prompt as Admin

### 2. Activate DLC and bypass access restrictions to Z: drive
```
cd \Users\tex_analysis\Desktop
activate dlc-windowsGPU
net use Z:
Z:
```

### 3. Run script
```
python Y:\\student_folders\\Sacha\\Code\\DLC_pyscript.py
```

#### All done! *Note*: while this is all you need to create a project in DLC, if you want a look under the hood of this program, click [here](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/runDLC_Walkthrough.md). Keep scrolling if you want to see the various functions in DLC. Also, please note that you must still create the symlinks manually in \videos folder of the project path!

# Functions in DeepLabCut

### Extracting frames
###### This function will create frames for each video in \videos. If you are using my modified scripts, then the number of frames that are extracted will be preset by the number of subsessions you have for that animal. The function's default settings are to extract frames that cover a large distribution of the feature space of the video. For more information, see the original documentation by the Mathis group [here](https://github.com/AlexEMG/DeepLabCut/blob/master/docs/functionDetails.md#c-data-selection). 

```python
deeplabcut.extract_frames(config_path)
```
![alt_text](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/Images/extract_frames.PNG)

### Labeling frames
```python
deeplabcut.label_frames(config_path)
```
