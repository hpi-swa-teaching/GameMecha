as yet unclassified
mouseUp: evt

	isPressed ifTrue: [action ifNotNil: [action value]].
	isPressed := false.
	self changed