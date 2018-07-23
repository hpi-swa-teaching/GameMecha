testing
denyCollision: aMorph with: anotherMorph andOffset: aPoint
	self assertCollision: aMorph with: anotherMorph andOffset: aPoint equals: false