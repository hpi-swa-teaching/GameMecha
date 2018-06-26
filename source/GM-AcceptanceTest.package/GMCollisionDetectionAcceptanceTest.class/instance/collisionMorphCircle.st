creation
collisionMorphCircle
	^ CircleMorph new
		collisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		yourself