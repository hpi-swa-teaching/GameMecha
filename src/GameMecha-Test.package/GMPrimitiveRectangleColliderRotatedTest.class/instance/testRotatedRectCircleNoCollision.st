test cases
testRotatedRectCircleNoCollision
	
	self 
		denyCollision: self rotatedRectMorph
		with: self circleMorph
		andOffset: self class circleOffsetNoCollision