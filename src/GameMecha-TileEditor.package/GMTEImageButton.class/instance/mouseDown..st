event handling
mouseDown: anEvent

	self enabled ifFalse: [^ nil].

	super mouseDown: anEvent.
	anEvent yellowButtonPressed ifTrue: [^ self].
	
	self updateVisualState: anEvent