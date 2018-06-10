testing
testAddAndRemove
	self collisionHandler removeAllMorphs.
	self deny: [self collisionHandler includes: self collisionTestMorph].
	self collisionHandler addCollisionMorph: self collisionTestMorph.
	self assert: [self collisionHandler includes: self collisionTestMorph].
	self collisionHandler removeMorph: self collisionTestMorph.
	self deny: [self collisionHandler includes: self collisionTestMorph].
	