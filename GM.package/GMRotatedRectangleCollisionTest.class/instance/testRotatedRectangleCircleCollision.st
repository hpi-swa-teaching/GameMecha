testing
testRotatedRectangleCircleCollision
	self circle center: self rotatedRectangleShell center + self class circleCenterOffsetCollision. 
	self 
		assert: [self collisionHandler is: self rotatedRectangleShell collidingWith: self circle];
		assert: [self collisionHandler is: self circle collidingWith: self rotatedRectangleShell].