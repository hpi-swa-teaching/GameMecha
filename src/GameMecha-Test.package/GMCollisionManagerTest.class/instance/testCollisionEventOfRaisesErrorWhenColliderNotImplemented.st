test cases
testCollisionEventOfRaisesErrorWhenColliderNotImplemented

	self should: [self collisionManager collisionEventOf: self morphA with: Morph new] raise: Error