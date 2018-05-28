testing
testRotatedRectangleRotatedRectangleNoCollision
	self rotatedRectangleTallShell center: self rotatedRectangleShell center + self class rotatedRectangleTallCenterOffsetNoCollision;
		angle: self class rotatedRectangleAngle.
	self 
		deny: [self collisionHandler is: self rotatedRectangleTallShell collidingWith: self rotatedRectangleShell];
		deny: [self collisionHandler is: self rotatedRectangleShell collidingWith: self rotatedRectangleTallShell].