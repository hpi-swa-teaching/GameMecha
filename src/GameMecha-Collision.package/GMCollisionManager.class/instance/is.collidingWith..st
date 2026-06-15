collision
is: aMorph collidingWith: anotherMorph
	
	self checkForColliderOf: aMorph and: anotherMorph.
	^ (aMorph ~~ anotherMorph) and: [aMorph collider isCollidingWith: anotherMorph collider]