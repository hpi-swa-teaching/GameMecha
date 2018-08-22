testing
assertCollision: aMorph with: anotherMorph equals: aBoolean
	self collisionHandler addCollisionMorphs: {aMorph. anotherMorph}.
	self assertCollisionInHandler: aMorph with: anotherMorph equals: aBoolean.
	self collisionHandler removeAllMorphs.