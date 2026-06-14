test cases
testRotatedRectRotatedRectNoCollision
	
	self 
		denyCollision: self rotatedRectMorph
		with: self rotatedRectTallMorph
		andOffset: self class rotatedRectTallOffsetNoCollision