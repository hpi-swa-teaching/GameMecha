test cases
testAssertColliderDoesNotRaiseWhenColliderPresent

	self shouldnt: [self collisionManager assertCollider: self morphA] raise: Error