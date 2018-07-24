as yet unclassified
testAcceptance177023349 
	self assertCollision: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (932@697);
		extent: (100@100);
		yourself)
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (932@639);
		extent: (100@100);
		yourself)
	 equals: true