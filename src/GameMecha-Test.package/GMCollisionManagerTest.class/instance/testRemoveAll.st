test cases
testRemoveAll

	self collisionManager addMorph: self collisionMorph.
	self assert: [self collisionManager includes: self collisionMorph].
	self collisionManager removeAllMorphs.
	self deny: [self collisionManager includes: self collisionMorph]