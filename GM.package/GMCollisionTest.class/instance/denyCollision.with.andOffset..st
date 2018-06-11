testing
denyCollision: aMorph with: anotherMorph andOffset: aPoint
	self collisionHandler addCollisionMorphs: {aMorph. anotherMorph}.
	anotherMorph position: aMorph center + aPoint.
	self
		deny: [self collisionHandler is: aMorph collidingWith: anotherMorph];
		deny: [self collisionHandler is: anotherMorph collidingWith: aMorph].
	self collisionHandler removeAllMorphs.