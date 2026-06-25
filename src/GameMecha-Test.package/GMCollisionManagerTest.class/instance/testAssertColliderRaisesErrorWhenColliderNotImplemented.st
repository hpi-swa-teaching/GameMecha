test cases
testAssertColliderRaisesErrorWhenColliderNotImplemented

	self should: [self collisionManager assertCollider: Morph new] raise: Error