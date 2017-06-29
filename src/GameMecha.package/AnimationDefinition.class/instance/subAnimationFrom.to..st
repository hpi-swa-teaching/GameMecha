subanimations
subAnimationFrom: startIndex to: endIndex
	^ (self class new)
		cache: self cache;
		frameTime: self frameTime;
		spritePath: self spritePath;
		looping: self looping;
		startIndex: startIndex;
		endIndex: endIndex;
		yourself.