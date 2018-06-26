as yet unclassified
testAcceptance36601350 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		 atPosition: (258@675))
	 with: (CircleMorph new 
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		position: (258@681);
		extent:(100@100))
	 equals: true