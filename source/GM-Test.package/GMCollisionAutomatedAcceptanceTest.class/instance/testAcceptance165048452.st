test cases
testAcceptance165048452 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (912@739))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (912@590);
		extent: (100@100);
		yourself)
	 equals: false