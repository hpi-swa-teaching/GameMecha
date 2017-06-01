initializing
step
	self position: self position
		+ (self keyboard WASDVector * 10 asPoint)
		+ (self keyboard arrowKeyVector * 3 asPoint).
	self color: ((self keyboard isKeyDown: $1)
		ifTrue: [Color green] ifFalse: [Color red]).