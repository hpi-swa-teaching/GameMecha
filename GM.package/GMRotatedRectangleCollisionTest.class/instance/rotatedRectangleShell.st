accessing
rotatedRectangleShell
	^ rotatedRectangleShell ifNil:
		[rotatedRectangleShell := 
			(Morph new
				extent: self class rotatedRectangleExtent;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleShell collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
			angle: self class rotatedRectangleAngle]