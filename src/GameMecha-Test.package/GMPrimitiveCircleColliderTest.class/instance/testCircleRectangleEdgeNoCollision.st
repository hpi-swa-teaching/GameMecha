test cases
testCircleRectangleEdgeNoCollision

	self
		denyCollision: self rectangleMorph
		with: self smallCircleMorph
		andOffset: self class circleEdgeNoCollisionOffset

