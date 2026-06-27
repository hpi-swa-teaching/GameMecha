test cases
testCollisionEventOfRaisesErrorForNilCollider

	| morphWithNilCollider |
	morphWithNilCollider := GMCollisionTestMorph new.
	self should: [self collisionManager collisionEventOf: self morphA with: morphWithNilCollider] raise: Error