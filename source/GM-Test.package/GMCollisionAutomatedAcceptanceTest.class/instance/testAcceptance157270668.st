as yet unclassified
testAcceptance157270668 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		 atPosition: (126@613))
	 with: (RectangleMorph new 
		collisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (126@670);
		extent:(100@100))
	 equals: true