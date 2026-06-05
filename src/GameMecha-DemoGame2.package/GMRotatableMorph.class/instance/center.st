accessing
center

	self isRotated ifTrue: [^ self owner center].
	^ super center
	