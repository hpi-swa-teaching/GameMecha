testing
testRemoveAll
	self collisionHandler addCollisionMorph: self collisionMorph.
	self assert: [self collisionHandler includes: self collisionMorph].
	self collisionHandler removeAllMorphs.
	self deny: [self collisionHandler includes: self collisionMorph].