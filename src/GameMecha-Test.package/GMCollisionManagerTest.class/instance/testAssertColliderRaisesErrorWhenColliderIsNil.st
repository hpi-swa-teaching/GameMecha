test cases
testAssertColliderRaisesErrorWhenColliderIsNil

	self should: [self collisionManager assertCollider: GMCollisionTestMorph new] raise: Error