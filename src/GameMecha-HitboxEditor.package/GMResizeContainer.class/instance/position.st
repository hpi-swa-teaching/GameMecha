accessing
position

	self isRotated ifTrue: [^ self owner position].
	^ super position