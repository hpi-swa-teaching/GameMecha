testing
testCircleCircleNoCollision
	self denyCollision: self smallCircle with: self bigCircle andOffset: (self smallCircle extent - (1 @ 1)).