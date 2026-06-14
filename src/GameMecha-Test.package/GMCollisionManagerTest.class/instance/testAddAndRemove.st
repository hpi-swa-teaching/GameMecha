test cases
testAddAndRemove

	self collisionManager removeAllMorphs.
	self deny: [self collisionManager includes: self collisionMorph].
	self collisionManager addMorph: self collisionMorph.
	self assert: [self collisionManager includes: self collisionMorph].
	self collisionManager removeMorph: self collisionMorph.
	self deny: [self collisionManager includes: self collisionMorph]