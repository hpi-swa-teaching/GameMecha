event handling
keyStroke: anEvent

	super keyStroke: anEvent.
	self actionBlock ifNotNil: [self actionBlock value: self contents]