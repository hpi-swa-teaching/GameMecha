test cases
testCollisionEventOfNonOverlappingMorphsReturnsNullEvent

	| event |
	morphB center: 500 @ 500.
	event := self collisionManager collisionEventOf: morphA with: morphB.
	
	self assert: (event isKindOf: GMNullCollisionEvent)