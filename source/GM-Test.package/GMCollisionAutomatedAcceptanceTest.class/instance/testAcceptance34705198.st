as yet unclassified
testAcceptance34705198 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (932@691))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (932@626);
		extent: (100@100);
		yourself)
	 equals: true