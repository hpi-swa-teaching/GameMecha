test cases
testCircleRectangleEdgeCollision

	self
		assertCollision: self rectangleMorph
		with: self smallCircleMorph
		andOffset: self class circleEdgeOffset

