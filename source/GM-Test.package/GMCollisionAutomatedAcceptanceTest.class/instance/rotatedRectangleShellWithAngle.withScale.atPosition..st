as yet unclassified
rotatedRectangleShellWithAngle: anAngle withScale: aScale atPosition: aPosition
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
		scale: aScale;
		yourself