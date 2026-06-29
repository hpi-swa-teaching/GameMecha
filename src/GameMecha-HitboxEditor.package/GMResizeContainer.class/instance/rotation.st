accessing
rotation

	self isRotated ifTrue: [^ self owner angle].
	^ 0.0