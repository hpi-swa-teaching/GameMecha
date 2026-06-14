testing
assertCollision: aMorph with: anotherMorph andOffset: aPoint equals: aBoolean

	anotherMorph center: aMorph center + aPoint.
	self assertCollision: aMorph with: anotherMorph equals: aBoolean
