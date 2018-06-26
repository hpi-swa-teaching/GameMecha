as yet unclassified
testAcceptance215446152 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		 atPosition: (295@578))
	 with: (RectangleMorph new 
		collisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (258@720);
		extent:(100@100))
	 equals: false