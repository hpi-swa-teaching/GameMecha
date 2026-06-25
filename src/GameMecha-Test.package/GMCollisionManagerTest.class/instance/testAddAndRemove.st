test cases
testAddAndRemove

	self collisionManager removeAllMorphs.
	self deny: (self collisionManager includes: morphA).
	self collisionManager addMorph: morphA.
	self assert: (self collisionManager includes: morphA).
	self collisionManager removeMorph: morphA.
	self deny: (self collisionManager includes: morphA)