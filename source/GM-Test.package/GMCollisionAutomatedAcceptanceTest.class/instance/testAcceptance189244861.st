as yet unclassified
testAcceptance189244861 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 2.1973055638992838
		 atPosition: (110@358))
	 with: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (126@670);
		extent:(100@100))
	 equals: false