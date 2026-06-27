test cases
testUpdateNotifiesBothMorphsOnCollision

	self collisionManager update.
	self assert: self morphA onCollisionCallCount equals: 1.
	self assert: self morphB onCollisionCallCount equals: 1