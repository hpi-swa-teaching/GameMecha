collision detection
is: aMorph collidingWith: anotherMorph
	^ (aMorph bounds intersects: anotherMorph bounds)
		ifTrue: [aMorph collisionDetectionStrategy isCollidingWith: anotherMorph]
		ifFalse: [false]
		