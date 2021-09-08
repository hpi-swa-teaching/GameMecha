test cases
testAcceptance220650680 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (408@418))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (408@353);
		extent: (100@100);
		yourself)
	 equals: true