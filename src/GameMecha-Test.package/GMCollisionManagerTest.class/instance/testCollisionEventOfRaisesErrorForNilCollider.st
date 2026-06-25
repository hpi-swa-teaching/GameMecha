test cases
testCollisionEventOfRaisesErrorForNilCollider

	| morphWithNilCollider |
	morphWithNilCollider := GMCollisionTestMorph new.
	self should: [self collisionManager collisionEventOf: morphA with: morphWithNilCollider] raise: Error