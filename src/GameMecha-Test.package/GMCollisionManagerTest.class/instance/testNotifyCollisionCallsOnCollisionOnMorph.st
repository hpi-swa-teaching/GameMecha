test cases
testNotifyCollisionCallsOnCollisionOnMorph

	| event |
	event := self collisionManager collisionEventOf: self morphA with: self morphB.
	self collisionManager notifyCollision: self morphA with: event.
	self assert: self morphA onCollisionCallCount equals: 1.
	self assert: self morphB onCollisionCallCount equals: 0