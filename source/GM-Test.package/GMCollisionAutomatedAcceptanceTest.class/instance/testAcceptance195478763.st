as yet unclassified
testAcceptance195478763 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (932@691))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (983@589);
		extent: (100@100);
		yourself)
	 equals: false