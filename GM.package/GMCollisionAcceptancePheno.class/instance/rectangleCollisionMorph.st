collision
rectangleCollisionMorph
	^ RectangleMorph new
		collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself