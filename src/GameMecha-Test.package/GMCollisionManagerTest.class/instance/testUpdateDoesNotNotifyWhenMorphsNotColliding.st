test cases
testUpdateDoesNotNotifyWhenMorphsNotColliding

	self morphB center: 500 @ 500.
	self collisionManager update.
	self assert: self morphA onCollisionCallCount equals: 0.
	self assert: self morphB onCollisionCallCount equals: 0