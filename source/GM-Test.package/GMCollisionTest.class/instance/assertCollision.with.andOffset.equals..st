testing
assertCollision: aMorph with: anotherMorph andOffset: aPoint equals: aBoolean
	self collisionHandler addCollisionMorphs: {aMorph. anotherMorph}.
	anotherMorph position: aMorph center + aPoint.
	self assertCollisionInHandler: aMorph with: anotherMorph equals: aBoolean.
	self collisionHandler removeAllMorphs.