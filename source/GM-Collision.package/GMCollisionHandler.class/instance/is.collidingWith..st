collision detection
is: aMorph collidingWith: anotherMorph
	^ (aMorph fullBounds intersects: anotherMorph fullBounds)
		ifTrue: [aMorph collisionDetectionStrategy isCollidingWith: anotherMorph]
		ifFalse: [false]
		