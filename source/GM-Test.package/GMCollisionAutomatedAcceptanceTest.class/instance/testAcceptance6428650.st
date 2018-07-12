as yet unclassified
testAcceptance6428650 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		 atPosition: (215@692))
	 with: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (118@733);
		extent:(100@100))
	 equals: false