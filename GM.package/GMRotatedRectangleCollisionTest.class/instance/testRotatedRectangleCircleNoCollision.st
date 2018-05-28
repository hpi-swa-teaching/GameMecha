testing
testRotatedRectangleCircleNoCollision
	self circle center: self rotatedRectangleShell center + self class circleCenterOffsetNoCollision. 
	self 
		deny: [self collisionHandler is: self rotatedRectangleShell collidingWith: self circle];
		deny: [self collisionHandler is: self circle collidingWith: self rotatedRectangleShell].