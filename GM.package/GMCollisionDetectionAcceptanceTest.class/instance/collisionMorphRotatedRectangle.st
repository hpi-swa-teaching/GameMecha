creation
collisionMorphRotatedRectangle
	 | aMorph |
	aMorph := RectangleMorph new
		extent: self class collisionMorphExtent;
		yourself.
	self addMorph: aMorph.
	aMorph addFlexShell.
	
	^ aMorph owner 
		collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
		angle: 30;
		yourself