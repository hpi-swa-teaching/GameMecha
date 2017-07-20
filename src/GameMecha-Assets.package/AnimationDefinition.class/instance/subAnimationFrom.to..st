subanimations
subAnimationFrom: startIndex to: endIndex
	^ (self class new)
		frameTime: self frameTime;
		spriteSheet: self spriteSheet;
		looping: self looping;
		startIndex: startIndex + self startIndex;
		endIndex: endIndex;
		yourself.