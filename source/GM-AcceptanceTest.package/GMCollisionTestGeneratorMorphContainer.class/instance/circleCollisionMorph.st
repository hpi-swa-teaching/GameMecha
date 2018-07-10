as yet unclassified
circleCollisionMorph
	^ CircleMorph new
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself