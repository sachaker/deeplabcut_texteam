close all;
mouse = input('Which mouse? ','s');
path = strcat('Z:\data\HS\avi\',mouse);
dir(path)
date = input('Which session? (YYYYMMDD): ','s');
videos = dir(strcat(path,'\',date,'\*.avi'));
for i = 1:length(videos)
    disp([num2str(i) ') ' videos(i).name]);
end
videoID = input('Please select which video: ');
videoObject = VideoReader(strcat(path,'\',date,'\',videos(videoID).name));

done = 0;
while done == 0
    frame = randi(10000);
    thisFrame = read(videoObject,frame);
    imshow(thisFrame)
    colormap('default')
    movegui('northeast')
    axis on
    xlabel('X'); ylabel('Y')
    figure(1)
    goodFrame = input('Is this a good frame to use? (y/n): ','s');
    if strcmp(goodFrame,'y')
        x1 = input('Please input desired MIN for X axis: ');
        x2 = input('Please input desired MAX for X axis: ');
        y1 = input('Please input desired MIN for Y axis: ');
        y2 = input('Please input desired MAX for Y axis: ');
        xlim([x1 x2])
        ylim([y1 y2])
        happy = input('Are you happy with these parameters? (y/n) ','s');
        if strcmp(happy,'y')
            disp(['Please copy and paste the line below into config.yaml under video_sets for ' videos(videoID).name])
            disp(' ')
            disp(['crop: ',num2str(x1),',',num2str(x2),',',num2str(y1),',',num2str(y2)])
            done = 1;
            
        end
    end
end