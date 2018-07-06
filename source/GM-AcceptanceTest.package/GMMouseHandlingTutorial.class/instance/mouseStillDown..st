event handling
mouseStillDown: anEvent
	super mouseStillDown: anEvent.
	self extent: self extent + (5 @ 5).