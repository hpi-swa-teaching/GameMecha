accessing
scaledRotatedRectangleShell
	^ scaledRotatedRectangleShell ifNil: [scaledRotatedRectangleShell := 
		(self newShellWithExtent: self class rotatedRectangleExtent / self class scaledRotatedRectangleScale)
			gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleAngle;
			scale: self class scaledRotatedRectangleScale;
			yourself]