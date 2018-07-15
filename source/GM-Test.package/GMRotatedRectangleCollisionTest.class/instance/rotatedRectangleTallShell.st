accessing
rotatedRectangleTallShell
	^ rotatedRectangleTallShell ifNil:
		[rotatedRectangleTallShell := 
			(self newMorphWithOwner
				extent: self class rotatedRectangleTallExtent;
				center: 0 @ 0;
				addFlexShell;
				owner).
		rotatedRectangleTallShell gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleTallAngle]
			 