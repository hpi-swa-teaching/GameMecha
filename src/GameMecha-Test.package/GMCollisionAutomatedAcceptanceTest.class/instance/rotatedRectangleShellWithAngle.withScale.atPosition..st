testing
rotatedRectangleShellWithAngle: aNumber withScale: anotherNumber atPosition: aPoint
	| aMorph |
	aMorph := RectangleMorph new
		extent: 100 @ 100;
		yourself.
	Morph new addMorph: aMorph.
	aMorph addFlexShell.
	^ aMorph owner 
		gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
		angle: aNumber;
		position: aPoint;
		scale: anotherNumber;
		yourself