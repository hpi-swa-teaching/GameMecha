as yet unclassified
testAcceptance39976651 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (932@773))
	 with: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (932@607);
		extent: (100@100);
		yourself)
	 equals: false