testing
assertCollisionInManager: aMorph with: anotherMorph equals: aBoolean

	self
		assert: (self collisionManager is: aMorph collidingWith: anotherMorph) equals: aBoolean;
		assert: (self collisionManager is: anotherMorph collidingWith: aMorph) equals: aBoolean