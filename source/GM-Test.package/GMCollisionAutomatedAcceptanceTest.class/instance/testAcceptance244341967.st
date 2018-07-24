as yet unclassified
testAcceptance244341967 
	self assertCollision: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (932@697);
		extent: (100@100);
		yourself)
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (932@571);
		extent: (100@100);
		yourself)
	 equals: false