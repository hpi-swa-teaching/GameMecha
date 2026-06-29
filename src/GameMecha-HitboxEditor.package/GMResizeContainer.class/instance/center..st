accessing
center: aPoint

	self isRotated ifTrue: [self owner center: aPoint] ifFalse: [super center: aPoint]