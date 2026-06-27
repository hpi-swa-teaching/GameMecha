test cases
testAddAndRemove

	self collisionManager removeAllMorphs.
	self deny: (self collisionManager includes: self morphA).
	self collisionManager addMorph: self morphA.
	self assert: (self collisionManager includes: self morphA).
	self collisionManager removeMorph: self morphA.
	self deny: (self collisionManager includes: self morphA)