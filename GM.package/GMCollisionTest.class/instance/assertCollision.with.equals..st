testing
assertCollision: aMorph with: anotherMorph equals: aBoolean
	self collisionHandler addCollisionMorphs: {aMorph. anotherMorph}.
	self
		assert: (self collisionHandler is: aMorph collidingWith: anotherMorph) equals: aBoolean;
		assert: (self collisionHandler is: anotherMorph collidingWith: aMorph) equals: aBoolean.
	self collisionHandler removeAllMorphs.