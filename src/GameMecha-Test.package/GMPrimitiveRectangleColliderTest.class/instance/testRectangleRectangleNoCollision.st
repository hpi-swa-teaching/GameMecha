test cases
testRectangleRectangleNoCollision

	self 
		denyCollision: self smallRectangleMorph
		with: self bigRectangleMorph
		andOffset: self bigRectangleMorph extent
