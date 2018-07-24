accessing
scaledRotatedRectangleShell
	^ scaledRotatedRectangleShell ifNil: [rotatedRectangleShell := 
		(self newShellWithExtent: self class rotatedRectangleExtent / self class scaledRotatedRectangleScale)
			gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleAngle;
			scale: self class scaledRotatedRectangleScale;
			yourself]