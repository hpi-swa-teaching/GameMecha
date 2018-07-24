accessing
rotatedRectangleTallShell
	^ rotatedRectangleTallShell ifNil: [rotatedRectangleTallShell := 
		(self newShellWithExtent: self class rotatedRectangleTallExtent)
			gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleTallAngle;
			yourself]
			 