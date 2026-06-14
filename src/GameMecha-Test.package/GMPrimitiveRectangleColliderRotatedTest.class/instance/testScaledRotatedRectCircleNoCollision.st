test cases
testScaledRotatedRectCircleNoCollision
	
	self 
		denyCollision: self scaledRotatedRectMorph
		with: self circleMorph
		andOffset: self class circleOffsetNoCollision