testing
testRotatedRectangleRectangleCollision
self rectangle center: self rotatedRectangleShell center+ self class rectangleCenterOffsetCollision.
	self 
		assert: [self collisionHandler is: self rectangle collidingWith: self rotatedRectangleShell];
		assert: [self collisionHandler is: self rotatedRectangleShell collidingWith: self rectangle].