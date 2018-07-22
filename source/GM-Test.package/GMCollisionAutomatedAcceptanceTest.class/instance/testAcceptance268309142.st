as yet unclassified
testAcceptance268309142 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (118@719))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (118@562);
		extent:(100@100);
		yourself)
	 equals: false