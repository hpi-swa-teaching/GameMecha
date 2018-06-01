collision
rectangleCollisionMorph
	^ RectangleMorph new
		collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
		extent: 100 @ 100;
		position: self position;
		yourself