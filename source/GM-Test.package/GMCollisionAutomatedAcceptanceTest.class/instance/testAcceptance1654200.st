as yet unclassified
testAcceptance1654200 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		 atPosition: (326@575))
	 with: (CircleMorph new 
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		position: (258@681);
		extent:(100@100))
	 equals: false