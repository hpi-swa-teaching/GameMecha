as yet unclassified
testAcceptance104564010 
	self assertCollision: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (118@591);
		extent:(100@100))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (118@633);
		extent:(100@100))
	 equals: true