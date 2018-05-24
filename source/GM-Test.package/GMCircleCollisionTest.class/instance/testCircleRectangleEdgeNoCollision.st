testing
testCircleRectangleEdgeNoCollision
	self rectangle position: (0 @ 0).
	self smallCircle position: self rectangle position + self rectangle extent + self circleEdgeNoCollisionOffset.
	self
		deny: [self collisionHandler is: self rectangle collidingWith: self smallCircle];
		deny: [self collisionHandler is: self smallCircle collidingWith: self rectangle].