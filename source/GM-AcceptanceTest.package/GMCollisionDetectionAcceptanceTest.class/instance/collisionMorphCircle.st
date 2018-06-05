creation
collisionMorphCircle
	^ CircleMorph new
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		extent: self class collisionMorphExtent;
		yourself