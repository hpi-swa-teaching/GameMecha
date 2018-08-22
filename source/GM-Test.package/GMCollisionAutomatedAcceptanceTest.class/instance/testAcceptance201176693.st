test cases
testAcceptance201176693 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (929@523))
	 with: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (912@640);
		extent: (100@100);
		yourself)
	 equals: false