testing
testScaledRotatedRectangleCircleNoCollision
	self circle center: self scaledRotatedRectangleShell center + self class circleCenterOffsetNoCollision. 
	self 
		deny: [self collisionHandler is: self scaledRotatedRectangleShell collidingWith: self circle];
		deny: [self collisionHandler is: self circle collidingWith: self scaledRotatedRectangleShell].