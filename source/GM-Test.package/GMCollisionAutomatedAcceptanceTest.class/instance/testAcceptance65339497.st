as yet unclassified
testAcceptance65339497 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		 atPosition: (288@622))
	 with: (RectangleMorph new 
		collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
		position: (258@720);
		extent:(100@100))
	 equals: true