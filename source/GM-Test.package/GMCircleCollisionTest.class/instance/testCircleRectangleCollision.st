testing
testCircleRectangleCollision
	self smallCircle position: self rectangle position.
	self assert: [self collisionHandler is: self rectangle collidingWith: self smallCircle].
	self assert: [self collisionHandler is: self smallCircle collidingWith: self rectangle].