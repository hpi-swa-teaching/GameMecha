test cases
testAcceptance65356020 
	self assertCollision: (RectangleMorph new 
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		position: (912@662);
		extent: (100@100);
		yourself)
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (943@550);
		extent: (100@100);
		yourself)
	 equals: false