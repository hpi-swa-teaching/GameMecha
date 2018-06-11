as yet unclassified
circleCollisionMorph
	^ CircleMorph new
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself