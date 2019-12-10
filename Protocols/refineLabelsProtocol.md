# Refining labels and retraining networks
###### Oftentimes DLC models don't perform as good as we'd like them to after one round of training. This protocol reviews the steps involved in fixing predictions and retraining the network.

### Step 0:
a) Run Command Prompt as Admin

b) `cd \users\USERNAME\Desktop`

`activate dlc-windowsGPU`

`net use Z:`

`Z:`

`ipython`

c) `import deeplabcut`

### Step 1:
Set variables (example below)

`configPath = r'\\live.rd.ucl.ac.uk\ritd-ag-project-rd00bj-cbutf60\data\HS\DLC\cb138\20170815\cb138-20170815-JS-2019-10-07\config.yaml'`

`videoPath = r'\\live.rd.ucl.ac.uk\ritd-ag-project-rd00bj-cbutf60\data\HS\avi\cb138\20170815'`

### Step 2:
Extract frames to correct (NOTE: all sessions in **bold** on the shared Google Sheets already have frames extracted, so skip these ones)

`deeplabcut.extract_outlier_frames(configPath, [videoPath], automatic=True)`

### Step 3:
Start correcting the labels

`deeplabcut.refine_labels(configPath)`

**NOTE**

- the likelihood threshold in the GUI is just for visualization purposes -- pick what ever you like!

- if you quit and reload the labels, they will appear jumbled even though your original labels are actually saved!

- load in frames from \labeled-data\subsession_00x

- check the whiskers in \labeled-data\subsession_00x_labeled

### Step 4:
Merge the corrected labels with previous labels and create training set

`deeplabcut.merge_datasets(configPath)`

`deeplabcut.create_training_dataset(configPath)`

### Step 5:
Open 'pose_cfg.yaml' (example path below) 

*Z:\data\HS\DLC\cb138\20170815\cb138-20170815-JS-2019-10-07\dlc-models\iteration-1\cb138-20170815Oct7-trainset95shuffle1\train\pose_cfg.yaml* 

Change the parameter 'multi_step' to the following:
- multi_step: [0.005, 10000] [0.02, 250000] [0.002, 300000]

### Step 6:

`deeplabcut.train_network(configPath)`

### Step 7:
#### a) Open avi session folder  (*e.g.* Z:\data\HS\avi\cb138\20170815)
#### b) Create a new folder called 'oldModel'
#### c) Move all files in folder except HS avi's into 'oldModel'

### Step 8:
Generate predictions with new DLC model

`deeplabcut.analyze_videos(configPath, [videoPath], videotype = '.avi', save_as_csv = True)` 
