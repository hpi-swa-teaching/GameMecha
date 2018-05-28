accessing
rotatedRectangleTallShell
	^ rotatedRectangleTallShell ifNil:
		[rotatedRectangleTallShell := 
			(Morph new
				extent: self class rotatedRectangleTallExtent;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleTallShell collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
			angle: self class rotatedRectangleTallAngle]
			 