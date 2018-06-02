collision
rotatedRectangleCollisionMorph
	 | aMorph |
	aMorph := RectangleMorph new.
	self addMorph: aMorph.
	aMorph
		extent: 200 @ 100;
		position: self position;
		addFlexShell;
		yourself.
	self removeMorph: aMorph.
	^ aMorph owner 
		collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
		angle: 30;
		yourself