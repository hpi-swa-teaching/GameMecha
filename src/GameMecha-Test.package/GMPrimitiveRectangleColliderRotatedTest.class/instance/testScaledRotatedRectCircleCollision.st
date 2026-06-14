test cases
testScaledRotatedRectCircleCollision
	
	self 
		assertCollision: self scaledRotatedRectMorph
		with: self circleMorph
		andOffset: self class circleOffsetCollision