test cases
testAddMorphs

	self assert: (self collisionManager includes: self morphA).
	self assert: (self collisionManager includes: self morphB)