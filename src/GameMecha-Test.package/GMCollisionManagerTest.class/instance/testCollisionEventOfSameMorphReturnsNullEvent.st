test cases
testCollisionEventOfSameMorphReturnsNullEvent

	| event |
	event := self collisionManager collisionEventOf: morphA with: morphA.
	self assert: event hasCollided equals: false