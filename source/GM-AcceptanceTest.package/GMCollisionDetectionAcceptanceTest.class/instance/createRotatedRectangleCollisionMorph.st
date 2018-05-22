creation
createRotatedRectangleCollisionMorph
	^ RectangleMorph new
		extent: 200 @ 100;
		addFlexShell;
		collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
		rotationDegrees: 30;
		owner