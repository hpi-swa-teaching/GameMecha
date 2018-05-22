accessing
bigRectangle
	^ bigRectangle ifNil: [bigRectangle := self createBigCollisionRectangle]