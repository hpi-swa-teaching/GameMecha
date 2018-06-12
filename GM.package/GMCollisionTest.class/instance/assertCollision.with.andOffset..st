testing
assertCollision: aMorph with: anotherMorph andOffset: aPoint
	self collisionHandler addCollisionMorphs: {aMorph. anotherMorph}. 
	anotherMorph position: aMorph center + aPoint.
	self
		assert: [self collisionHandler is: aMorph collidingWith: anotherMorph];
		assert: [self collisionHandler is: anotherMorph collidingWith: aMorph].
	self collisionHandler removeAllMorphs.