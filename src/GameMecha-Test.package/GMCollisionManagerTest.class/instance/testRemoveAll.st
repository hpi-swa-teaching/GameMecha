test cases
testRemoveAll

	self assert: (self collisionManager includes: morphA).
	self collisionManager removeAllMorphs.
	self deny: (self collisionManager includes: morphA)