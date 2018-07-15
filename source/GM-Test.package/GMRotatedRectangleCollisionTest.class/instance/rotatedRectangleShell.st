accessing
rotatedRectangleShell
	^ rotatedRectangleShell ifNil:
		[rotatedRectangleShell := 
			(self newMorphWithOwner
				extent: self class rotatedRectangleExtent;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleShell gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleAngle]