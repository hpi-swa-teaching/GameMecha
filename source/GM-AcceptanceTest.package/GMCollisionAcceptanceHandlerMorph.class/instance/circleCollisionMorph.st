as yet unclassified
circleCollisionMorph
	^ CircleMorph new
		collisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself