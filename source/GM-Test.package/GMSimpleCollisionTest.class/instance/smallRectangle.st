accessing
smallRectangle
	^ smallRectangle ifNil: [smallRectangle := self createSmallCollisionRectangle]