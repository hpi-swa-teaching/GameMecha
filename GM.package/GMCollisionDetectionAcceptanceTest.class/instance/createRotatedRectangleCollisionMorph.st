creation
createRotatedRectangleCollisionMorph
	 | aMorph |
	aMorph := RectangleMorph new.
	self addMorph: aMorph.
	aMorph
		extent: 200 @ 100;
		addFlexShell;
		rotationDegrees: 30;
		yourself.
	aMorph owner collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new.
	^ aMorph owner