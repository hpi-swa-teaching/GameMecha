creation
createRotatedRectangleCollisionMorph
	| rectangle |
	rectangle := RectangleMorph new
		extent: 200 @ 100;
		yourself.
	rectangle addFlexShell
		collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new;
		rotationDegrees: 30.
	^ rectangle owner