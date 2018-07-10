event handling
mouseDown: anEvent
"Overwritten to handle the button down event for a mouse button."
	super mouseDown: anEvent.
	self color: Color random.