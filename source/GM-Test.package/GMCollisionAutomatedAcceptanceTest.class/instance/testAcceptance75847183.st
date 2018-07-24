as yet unclassified
testAcceptance75847183 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (932@773))
	 with: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (928@689);
		extent: (100@100);
		yourself)
	 equals: true