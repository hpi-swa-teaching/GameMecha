creation
createRectangleCollisionMorph
	^ RectangleMorph new
		collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
		extent: 100 @ 100;
		yourself