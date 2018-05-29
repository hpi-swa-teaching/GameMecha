testing
denyCollision: aMorph with: anotherMorph andOffset: aPoint
	anotherMorph position: aMorph center + aPoint.
	self
		deny: [self collisionHandler is: aMorph collidingWith: anotherMorph];
		deny: [self collisionHandler is: anotherMorph collidingWith: aMorph].