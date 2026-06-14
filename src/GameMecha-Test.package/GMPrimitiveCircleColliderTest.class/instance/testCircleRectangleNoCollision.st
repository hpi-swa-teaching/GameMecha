test cases
testCircleRectangleNoCollision

	self 
		denyCollision: self smallCircleMorph
		with: self rectangleMorph
		andOffset: self smallCircleMorph extent


