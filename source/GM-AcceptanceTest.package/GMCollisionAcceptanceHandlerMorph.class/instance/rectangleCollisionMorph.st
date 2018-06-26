as yet unclassified
rectangleCollisionMorph
	^ RectangleMorph new
		collisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself