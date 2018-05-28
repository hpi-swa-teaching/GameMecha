accessing
scaledRotatedRectangleShell
	^ scaledRotatedRectangleShell ifNil:
		[rotatedRectangleShell := 
			(Morph new
				extent: self class rotatedRectangleExtent / self class scaledRotatedRectangleScale;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleShell collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
			angle: self class rotatedRectangleAngle;
			scale: self class scaledRotatedRectangleScale]