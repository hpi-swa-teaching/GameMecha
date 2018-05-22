accessing
center
	^ (TransformMorph subclasses includes: self owner owner class) 
		ifTrue: [self owner owner center] 
		ifFalse: [self owner center]