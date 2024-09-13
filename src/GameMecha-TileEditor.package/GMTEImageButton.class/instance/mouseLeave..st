event handling
mouseLeave: anEvent

	self enabled ifFalse: [^ nil].
	
	self updateVisualState: anEvent