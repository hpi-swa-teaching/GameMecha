testing
testScaledRotatedRectangleCircleCollision
	self circle center: self scaledRotatedRectangleShell center + self class circleCenterOffsetCollision. 
	self 
		assert: [self collisionHandler is: self scaledRotatedRectangleShell collidingWith: self circle];
		assert: [self collisionHandler is: self circle collidingWith: self scaledRotatedRectangleShell].