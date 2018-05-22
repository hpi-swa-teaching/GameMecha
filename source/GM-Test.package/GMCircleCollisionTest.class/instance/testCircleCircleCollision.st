testing
testCircleCircleCollision
	self bigCircle center: 0 @ 0.
	self smallCircle center: 0 @ (self bigCircleRadius + self smallCircleRadius -1).
	self assert: [self collisionHandler is: self bigCircle collidingWith: self smallCircle].
	self assert: [self collisionHandler is: self smallCircle collidingWith: self bigCircle].
	self smallCircle center: (self bigCircleRadius + self smallCircleRadius) @ 0.
	self deny: [self collisionHandler is: self bigCircle collidingWith: self smallCircle].
	self deny: [self collisionHandler is: self smallCircle collidingWith: self bigCircle].