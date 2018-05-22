accessing
bigCircle
	^ bigCircle ifNil: [bigCircle := self createBigCollisionCircle]