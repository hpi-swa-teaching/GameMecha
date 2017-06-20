subanimations
subAnimationFrom: startIndex to: endIndex
	^ (self class new)
		cache: self cache;
		frameTime: self frameTime;
		looping: self looping;
		spriteNameList: (self spriteNameList copyFrom: startIndex + 1 to: endIndex + 1)
		yourself.