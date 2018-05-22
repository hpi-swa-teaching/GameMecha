accessing
fullBounds
	^  (TransformMorph subclasses includes: self owner owner class) 
		ifTrue: [self owner owner fullBounds] 
		ifFalse: [self owner fullBounds]