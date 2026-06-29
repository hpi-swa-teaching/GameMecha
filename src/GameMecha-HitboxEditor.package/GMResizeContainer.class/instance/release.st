accessing
release

	isRotated ifTrue: [self owner release].
	super release