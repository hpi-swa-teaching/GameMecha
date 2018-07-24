accessing
rotatedRectangleShell
	^ rotatedRectangleShell ifNil: [rotatedRectangleShell := 
		(self newShellWithExtent: self class rotatedRectangleExtent)
			gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleAngle;
			yourself]