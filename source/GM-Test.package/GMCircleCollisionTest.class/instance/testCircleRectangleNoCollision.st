testing
testCircleRectangleNoCollision
	self smallCircle position: self rectangle position + self rectangle extent. 
	self deny: [self collisionHandler is: self rectangle collidingWith: self smallCircle].
	self deny: [self collisionHandler is: self smallCircle collidingWith: self rectangle].