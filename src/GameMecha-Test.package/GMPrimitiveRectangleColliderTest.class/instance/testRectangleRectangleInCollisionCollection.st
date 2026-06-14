test cases
testRectangleRectangleInCollisionCollection

	self bigRectangleMorph center: self smallRectangleMorph center.
	self
		assert: [(self collisionManager morphsCollidingWith: self smallRectangleMorph) includes: self bigRectangleMorph];
		assert: [(self collisionManager morphsCollidingWith: self bigRectangleMorph) includes: self smallRectangleMorph]