testing
assertCollision: aMorph with: anotherMorph andOffset: aPoint equals: aBoolean
	anotherMorph position: aMorph center + aPoint.
	self assertCollision: aMorph with: anotherMorph equals: aBoolean.