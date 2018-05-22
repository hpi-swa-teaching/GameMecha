testing
testRectangleIsCollidingWithRectangle
	self collisionTestMorph position: self collidingTestMorph position.
	self
		assert: [self collisionHandler is: self collidingTestMorph collidingWith: self collisionTestMorph];
		assert: [self collisionHandler is: self collisionTestMorph collidingWith: self collidingTestMorph].