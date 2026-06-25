test cases
testCollisionEventOfRaisesErrorWhenColliderNotImplemented

	self should: [self collisionManager collisionEventOf: morphA with: Morph new] raise: Error