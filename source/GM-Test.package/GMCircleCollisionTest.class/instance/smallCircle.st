accessing
smallCircle
	^ smallCircle ifNil: [smallCircle := self createSmallCollisionCircle]