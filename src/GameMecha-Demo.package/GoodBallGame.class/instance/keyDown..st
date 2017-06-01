initializing
keyDown: anEvent
	self keyboard onKeyDown: anEvent.
	Transcript showln: anEvent keyValue.