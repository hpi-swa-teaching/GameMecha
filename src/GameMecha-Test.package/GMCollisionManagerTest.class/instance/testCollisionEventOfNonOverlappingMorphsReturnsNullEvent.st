test cases
testCollisionEventOfNonOverlappingMorphsReturnsNullEvent

	| event |
	self morphB center: 500 @ 500.
	event := self collisionManager collisionEventOf: self morphA with: self morphB.
	
	self assert: (event isKindOf: GMNullCollisionEvent)