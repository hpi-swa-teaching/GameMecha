test cases
testCollisionEventOfOverlappingMorphsReturnsCollisionEvent

	| event |
	event := self collisionManager collisionEventOf: morphA with: morphB.
	self assert: event hasCollided equals: true.
	self assert: (event isKindOf: GMMorphCollisionEvent)