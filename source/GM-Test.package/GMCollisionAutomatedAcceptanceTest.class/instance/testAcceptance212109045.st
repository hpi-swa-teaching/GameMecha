test cases
testAcceptance212109045 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (929@553))
	 with: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (912@640);
		extent: (100@100);
		yourself)
	 equals: true