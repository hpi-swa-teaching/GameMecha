testing
testRectangleRectangleCollision
	self collidingTestMorph position: self collisionTestMorph position.
	self 
		assert: [(self collisionHandler morphsCollidingWith: self collidingTestMorph) includes: self collisionTestMorph];
		assert: [(self collisionHandler morphsCollidingWith: self collisionTestMorph) includes: self collidingTestMorph].