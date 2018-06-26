as yet unclassified
rotatedRectangleShellWithAngle: anAngle atPosition: aPosition
	| aMorph |
	aMorph := RectangleMorph new
		extent: 100 @ 100;
		yourself.
	Morph new addMorph: aMorph.
	aMorph addFlexShell.
	^ aMorph owner 
		collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
		angle: anAngle;
		position: aPosition;
		yourself