testing
testRectangleRectangleNoCollision
	self collisionTestMorph position: self collidingTestMorph position + self collidingTestMorph extent.
	self 
		deny: [(self collisionHandler morphsCollidingWith: self collidingTestMorph) includes: self collisionTestMorph];
		deny: [(self collisionHandler morphsCollidingWith: self collidingTestMorph) includes: self collisionTestMorph].