displaying
currentFrameNumber
	"the current raw image number of the animation"
	^  (self stopwatch duration asMilliSeconds / self definition frameTime) floor.