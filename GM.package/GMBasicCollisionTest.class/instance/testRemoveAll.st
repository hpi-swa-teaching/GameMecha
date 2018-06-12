testing
testRemoveAll
	self collisionHandler addCollisionMorph: self collisionTestMorph.
	self assert: [self collisionHandler includes: self collisionTestMorph].
	self collisionHandler removeAllMorphs.
	self deny: [self collisionHandler includes: self collisionTestMorph].