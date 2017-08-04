as yet unclassified
step 
	super step.
	self progress: self progress + 1.
	(self progress < 100) 
		ifTrue: [self position: (self startPosition interpolateTo: self endPosition at: (progress / 100))]
	 	ifFalse: [self progress: self progress - 100].