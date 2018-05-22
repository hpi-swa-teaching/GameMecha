accessing
scale
	^ (TransformationMorph subclasses includes: self owner owner class) 
		ifTrue: [self owner owner scale] 
		ifFalse: [1]