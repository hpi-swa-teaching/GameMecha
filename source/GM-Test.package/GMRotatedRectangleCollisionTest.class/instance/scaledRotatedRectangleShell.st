accessing
scaledRotatedRectangleShell
	^ scaledRotatedRectangleShell ifNil:
		[rotatedRectangleShell := 
			(self newMorphWithOwner
				extent: self class rotatedRectangleExtent / self class scaledRotatedRectangleScale;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleShell gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleAngle;
			scale: self class scaledRotatedRectangleScale]