test cases
testAddAndRemove
	self collisionHandler removeAllMorphs.
	self deny: [self collisionHandler includes: self collisionMorph].
	self collisionHandler addCollisionMorph: self collisionMorph.
	self assert: [self collisionHandler includes: self collisionMorph].
	self collisionHandler removeCollisionMorph: self collisionMorph.
	self deny: [self collisionHandler includes: self collisionMorph].
	