collision detection
is: aMorph collidingWith: anotherMorph
	^ (aMorph bounds intersects: anotherMorph bounds)
		and: [aMorph gmCollisionDetectionShape isCollidingWith: anotherMorph]
		