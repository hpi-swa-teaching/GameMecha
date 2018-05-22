testing
testCircleRectangleCollision
	self rectangle position: 0 @ 0.
	self smallCircle position: 45 @ 0.
	self assert: [self collisionHandler is: self rectangle collidingWith: self smallCircle].
	self assert: [self collisionHandler is: self smallCircle collidingWith: self rectangle].
	self smallCircle position: -40 @ -40.
	self assert: [self collisionHandler is: self rectangle collidingWith: self smallCircle].
	self assert: [self collisionHandler is: self smallCircle collidingWith: self rectangle].
	self smallCircle position: 45 @ 45. 
	self deny: [self collisionHandler is: self rectangle collidingWith: self smallCircle].
	self deny: [self collisionHandler is: self smallCircle collidingWith: self rectangle].
	self smallCircle position: -45 @ -45.
	self deny: [self collisionHandler is: self rectangle collidingWith: self smallCircle].
	self deny: [self collisionHandler is: self smallCircle collidingWith: self rectangle].