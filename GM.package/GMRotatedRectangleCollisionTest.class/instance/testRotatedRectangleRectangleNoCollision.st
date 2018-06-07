testing
testRotatedRectangleRectangleNoCollision
self rectangle center: self rotatedRectangleShell center + self class rectangleCenterOffsetNoCollision.
	self 
		deny: [self collisionHandler is: self rectangle collidingWith: self rotatedRectangleShell];
		deny: [self collisionHandler is: self rotatedRectangleShell collidingWith: self rectangle].