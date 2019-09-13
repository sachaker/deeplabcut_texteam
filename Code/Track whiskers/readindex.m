function outputFrame = readindex(videoSrc,frameNumber)
    info = get(videoSrc);
    videoSrc.CurrentTime = (frameNumber-1)/info.FrameRate;
    outputFrame = readFrame(videoSrc);