test cases
testCollisionEventOfOverlappingMorphsReturnsCollisionEvent

	| event |
	event := self collisionManager collisionEventOf: self morphA with: self morphB.
	self assert: event hasCollided equals: true.
	self assert: (event isKindOf: GMMorphCollisionEvent)