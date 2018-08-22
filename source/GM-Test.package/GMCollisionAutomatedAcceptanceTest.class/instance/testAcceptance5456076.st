test cases
testAcceptance5456076 
	self assertCollision: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (912@662);
		extent: (100@100);
		yourself)
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (912@629);
		extent: (100@100);
		yourself)
	 equals: true