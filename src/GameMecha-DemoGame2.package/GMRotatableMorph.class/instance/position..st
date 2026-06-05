accessing
position: aPoint

	self isRotated ifTrue: [self owner position: aPoint] ifFalse: [super position: aPoint]