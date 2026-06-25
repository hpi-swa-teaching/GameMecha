test cases
testUpdateDoesNotNotifyWhenMorphsNotColliding

	morphB center: 500 @ 500.
	self collisionManager update.
	self assert: morphA onCollisionCallCount equals: 0.
	self assert: morphB onCollisionCallCount equals: 0