test cases
testNotifyCollisionCallsOnCollisionOnMorph

	| event |
	event := self collisionManager collisionEventOf: morphA with: morphB.
	self collisionManager notifyCollision: morphA with: event.
	self assert: morphA onCollisionCallCount equals: 1.
	self assert: morphB onCollisionCallCount equals: 0