test cases
testAcceptance187278999 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (912@739))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (911@661);
		extent: (100@100);
		yourself)
	 equals: true