creation
rotatedRectangleCollisionMorph
	 | aMorph |
	aMorph := RectangleMorph new.
	self addMorph: aMorph.
	aMorph
		extent: 200 @ 100;
		addFlexShell;
		yourself.
	^ aMorph owner 
		collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
		angle: 30;
		yourself