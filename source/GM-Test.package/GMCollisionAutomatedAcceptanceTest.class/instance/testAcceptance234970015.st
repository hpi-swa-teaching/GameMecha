as yet unclassified
testAcceptance234970015 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 2.1973055638992838
		 atPosition: (58@545))
	 with: (RectangleMorph new 
		collisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (126@670);
		extent:(100@100))
	 equals: true