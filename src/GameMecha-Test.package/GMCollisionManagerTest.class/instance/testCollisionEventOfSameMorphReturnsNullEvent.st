test cases
testCollisionEventOfSameMorphReturnsNullEvent

	| event |
	event := self collisionManager collisionEventOf: self morphA with: self morphA.
	self assert: event hasCollided equals: false