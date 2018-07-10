accessing
rotatedRectangleTallShell
	^ rotatedRectangleTallShell ifNil:
		[rotatedRectangleTallShell := 
			(self newMorphWithOwner
				extent: self class rotatedRectangleTallExtent;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleTallShell gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
			angle: self class rotatedRectangleTallAngle]
			 