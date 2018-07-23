testing
assertCollisionInHandler: aMorph with: anotherMorph equals: aBoolean
	self
		assert: (self collisionHandler is: aMorph collidingWith: anotherMorph) equals: aBoolean;
		assert: (self collisionHandler is: anotherMorph collidingWith: aMorph) equals: aBoolean.