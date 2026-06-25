test cases
testAssertColliderDoesNotRaiseWhenColliderPresent

	self shouldnt: [self collisionManager assertCollider: morphA] raise: Error