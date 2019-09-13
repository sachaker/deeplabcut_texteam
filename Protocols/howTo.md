# Running DeepLabCut
#### This is a more visual and step-by-step overview of my DLC_pyscript.py script
### 1. Import necessary libraries
```python
import deeplabcut, os
from datetime import datetime
```

### 2. Query user for session info (example in comments)
```python
mouse = input('Which mouse?: ') # cb107
date = input('Date? (YYYYMMDD): ') # 20170523
num_subsessions = int(input('How many subsessions?: ')) # 7
```

### 3. Prepare path variables and make directories if they don't exist
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

### 4. Navigate to this directory
```python
os.chdir(session_path)
```

### 5. Get video file data to be analyzed
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

### 6. 
