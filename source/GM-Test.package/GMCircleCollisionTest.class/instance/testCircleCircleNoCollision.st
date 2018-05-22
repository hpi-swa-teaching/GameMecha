testing
testCircleCircleNoCollision
	self smallCircle center: self bigCircle center + self bigCircle extent.
	self deny: [self collisionHandler is: self bigCircle collidingWith: self smallCircle].
	self deny: [self collisionHandler is: self smallCircle collidingWith: self bigCircle].