testing
testRotatedRectangleRotatedRectangleCollision
	self rotatedRectangleTallShell center: self rotatedRectangleShell center + self class rotatedRectangleTallCenterOffsetCollision.
	self 
		assert: [self collisionHandler is: self rotatedRectangleTallShell collidingWith: self rotatedRectangleShell];
		assert: [self collisionHandler is: self rotatedRectangleShell collidingWith: self rotatedRectangleTallShell].