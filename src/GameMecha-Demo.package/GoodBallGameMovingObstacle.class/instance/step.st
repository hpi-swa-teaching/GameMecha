as yet unclassified
step 
	super step.
	self progress: self progress + self stepTime.
	(self progress < 1000) 
		ifTrue: [self position: (self startPosition interpolateTo: self endPosition at: (progress / 1000))]
	 	ifFalse: [self progress: self progress - 1000].