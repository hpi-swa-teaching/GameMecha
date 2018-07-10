collision detection
is: aMorph collidingWith: anotherMorph
	^ (aMorph bounds intersects: anotherMorph bounds)
		ifTrue: [aMorph gmCollisionDetectionShape isCollidingWith: anotherMorph]
		ifFalse: [false]
		