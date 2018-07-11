as yet unclassified
rectangleCollisionMorph
	^ RectangleMorph new
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself