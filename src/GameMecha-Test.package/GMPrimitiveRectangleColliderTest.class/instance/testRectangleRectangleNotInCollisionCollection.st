test cases
testRectangleRectangleNotInCollisionCollection

	self smallRectangleMorph center: self bigRectangleMorph center + self bigRectangleMorph extent.
	self
		deny: [(self collisionManager morphsCollidingWith: self smallRectangleMorph) includes: self bigRectangleMorph];
		deny: [(self collisionManager morphsCollidingWith: self bigRectangleMorph) includes: self smallRectangleMorph]
