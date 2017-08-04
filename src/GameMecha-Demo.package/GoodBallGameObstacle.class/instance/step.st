initializing
step
	self touchedPlayer
		ifTrue: [self color: Color orange]
		ifFalse: [self color: Color green].