accessing
bigCircle
	^ bigCircle ifNil: [bigCircle := CircleMorph new
		extent: self class bigCircleDiameter;
		center: 0 @ 0;
		collisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		yourself]