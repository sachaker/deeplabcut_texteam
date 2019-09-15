# Running DeepLabCut

### Run Command Prompt as Admin

### Activate DLC, bypass access restrictions to Z: drive, and open Python environment
```
cd \Users\tex_analysis\Desktop
activate dlc-windowsGPU
net use Z:
Z:
ipython
```

### Import necessary libraries
```python
import deeplabcut, os
from datetime import datetime
```

### Query user for session info (example in comments)
```python
mouse = input('Which mouse?: ') # cb107
date = input('Date? (YYYYMMDD): ') # 20170523
num_subsessions = int(input('How many subsessions?: ')) # 7
```

### Prepare path variables and make directories if they don't exist
```python
session_path_mouse = 'Z:\\data\\HS\\DLC\\' + mouse
session_path = 'Z:\\data\\HS\\DLC\\' + mouse + '\\' + date

if not os.path.exists(session_path):
    print('folder does not exist')
    os.mkdir(session_path)
    print('created folder')
if not os.path.exists(session_path_mouse):
    print('folder does not exist')
    os.mkdir(session_path_mouse)
    print('created folder')
```

### Navigate to this directory
```python
os.chdir(session_path)
```

### Get video file data to be analyzed
```python
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
```

### Use our DLC syntax to set the project path 
```python
now = datetime.now()
year = now.strftime("%Y")
month = now.strftime("%m")
day = now.strftime("%d")
	
labeler = input('What are the initials of the primary labeler?: ')

projectPath = session_path + '\\' + mouse + '-' + date + '-' + labeler + '-' + year + '-' + month + '-' + day 
```

### Calculate number of frames per video (will be imported into config.yaml)
```python
totalFrames = 200
numframes = (totalFrames - (totalFrames % num_subsessions)) / num_subsessions
```

### Create the project
```python
config_path = deeplabcut.create_new_project(mouse + "-" + date, labeler, videoFiles) # just to be safe
```

### All done!
