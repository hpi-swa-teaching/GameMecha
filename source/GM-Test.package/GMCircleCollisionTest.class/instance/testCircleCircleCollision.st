testing
testCircleCircleCollision
	self smallCircle center: self bigCircle center.
	self 
		assert: [self collisionHandler is: self bigCircle collidingWith: self smallCircle];
		assert: [self collisionHandler is: self smallCircle collidingWith: self bigCircle].