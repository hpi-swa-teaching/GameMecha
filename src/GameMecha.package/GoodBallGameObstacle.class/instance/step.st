initializing
step
	super step.
	self touchesPlayer
		ifTrue: [self color: Color orange]
		ifFalse: [self color: Color green].
	self touchesPlayer: false.