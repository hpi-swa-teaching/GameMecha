test cases
testRotatedRectRectangleNoCollision
	
	self 
		denyCollision: self rotatedRectMorph
		with: self rectangleMorph
		andOffset: self class rectangleOffsetNoCollision