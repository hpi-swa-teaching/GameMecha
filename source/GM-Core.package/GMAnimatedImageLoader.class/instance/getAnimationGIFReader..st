as yet unclassified
getAnimationGIFReader: aString
	^ self cache at: aString ifAbsent: [self error: #AnimationNotLoaded]