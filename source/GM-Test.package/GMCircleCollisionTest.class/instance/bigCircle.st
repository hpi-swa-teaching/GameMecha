accessing
bigCircle
	^ bigCircle ifNil: [bigCircle := CircleMorph new
		extent: self class bigCircleDiameter;
		center: 0 @ 0;
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		yourself]