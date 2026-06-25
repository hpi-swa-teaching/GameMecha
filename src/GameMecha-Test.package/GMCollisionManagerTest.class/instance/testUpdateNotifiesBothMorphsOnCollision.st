test cases
testUpdateNotifiesBothMorphsOnCollision

	self collisionManager update.
	self assert: morphA onCollisionCallCount equals: 1.
	self assert: morphB onCollisionCallCount equals: 1