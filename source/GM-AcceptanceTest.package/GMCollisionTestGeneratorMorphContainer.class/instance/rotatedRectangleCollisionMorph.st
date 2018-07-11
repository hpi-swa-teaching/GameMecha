as yet unclassified
rotatedRectangleCollisionMorph
	 | aMorph |
	aMorph := RectangleMorph new
		extent: self class collisionMorphExtent;
		position: self position;
		yourself.
	self addMorph: aMorph.
	aMorph addFlexShell.
	^ aMorph owner
		gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
		angle: 30;
		yourself