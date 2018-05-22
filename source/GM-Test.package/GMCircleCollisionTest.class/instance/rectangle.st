accessing
rectangle
	^ rectangle ifNil: [rectangle := self createCollisionRectangle]