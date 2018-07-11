testing
assertCollision: aMorph with: anotherMorph
	self collisionHandler addCollisionMorphs: {aMorph. anotherMorph}.
	self
		assert: [self collisionHandler is: aMorph collidingWith: anotherMorph];
		assert: [self collisionHandler is: anotherMorph collidingWith: aMorph].
	self collisionHandler removeAllMorphs.