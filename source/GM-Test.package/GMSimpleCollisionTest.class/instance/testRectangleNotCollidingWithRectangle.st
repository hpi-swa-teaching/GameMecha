testing
testRectangleNotCollidingWithRectangle
	self collisionTestMorph position: self collidingTestMorph position + self collidingTestMorph extent.
	self deny: [self collisionHandler is: self collidingTestMorph collidingWith: self collisionTestMorph].
	self deny: [self collisionHandler is: self collisionTestMorph collidingWith: self collidingTestMorph].