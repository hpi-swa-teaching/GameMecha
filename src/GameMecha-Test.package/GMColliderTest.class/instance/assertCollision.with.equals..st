testing
assertCollision: aMorph with: anotherMorph equals: aBoolean

	self collisionManager addMorphs: {aMorph. anotherMorph}.
	self assertCollisionInManager: aMorph with: anotherMorph equals: aBoolean.
	self collisionManager
		removeMorph: aMorph;
		removeMorph: anotherMorph