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
python DLC_pyscript.py
```

#### All done! *Note*: while this is all you need to create a project in DLC, if you want a look under the hood of this program, click [here](https://github.com/sachaker/deeplabcut_texteam/blob/master/Protocols/runDLC_Walkthrough.md). Keep scrolling if you want to see the various functions in DLC. Also, please note that you must still create the symlinks manually in \videos folder of the project path!

# Functions in DeepLabCut

### Extracting frames
```python
deeplabcut.extract_frames(config_path)
```


