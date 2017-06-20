accessing
currentFrameNumber
	^  (self stopwatch duration asMilliSeconds / self definition frameTime) floor.