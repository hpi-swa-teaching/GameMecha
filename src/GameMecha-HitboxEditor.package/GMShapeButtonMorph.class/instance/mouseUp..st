event handling
mouseUp: evt

	isPressed ifTrue: [action ifNotNil: [action value]].
	isPressed := false.
	self changed