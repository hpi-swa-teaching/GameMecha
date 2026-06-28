test cases
testRemoveAll

	self assert: (self collisionManager includes: self morphA).
	self collisionManager removeAllMorphs.
	self deny: (self collisionManager includes: self morphA)