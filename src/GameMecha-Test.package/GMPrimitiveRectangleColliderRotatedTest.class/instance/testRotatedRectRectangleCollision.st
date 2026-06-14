test cases
testRotatedRectRectangleCollision
	
	self 
		assertCollision: self rotatedRectMorph
		with: self rectangleMorph
		andOffset: self class rectangleOffsetCollision