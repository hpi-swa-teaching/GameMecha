accessing
release

	self isRotated ifTrue: [self owner release].
	super release