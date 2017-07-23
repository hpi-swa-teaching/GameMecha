subanimations
subAnimationFrom: newStartIndex to: newEndIndex
	^ (self class new)
		frameTime: self frameTime;
		spriteSheet: self spriteSheet;
		looping: self looping;
		startIndex: newStartIndex + self startIndex - 1;
		endIndex: newEndIndex + self startIndex - 1;
		yourself.