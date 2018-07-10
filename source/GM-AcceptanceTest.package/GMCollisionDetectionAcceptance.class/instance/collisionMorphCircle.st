creation
collisionMorphCircle
	^ CircleMorph new
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		yourself