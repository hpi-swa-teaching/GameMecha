collision
is: aMorph collidingWith: anotherMorph

	^ (self shouldCheckCollisionBetween: aMorph and: anotherMorph) and: [aMorph collider isCollidingWith: anotherMorph collider]