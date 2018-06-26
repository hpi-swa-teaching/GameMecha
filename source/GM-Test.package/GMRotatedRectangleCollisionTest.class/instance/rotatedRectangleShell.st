accessing
rotatedRectangleShell
	^ rotatedRectangleShell ifNil:
		[rotatedRectangleShell := 
			(self newMorphWithOwner
				extent: self class rotatedRectangleExtent;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleShell collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
			angle: self class rotatedRectangleAngle]