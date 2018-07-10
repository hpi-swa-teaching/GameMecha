accessing
circle
	^ circle ifNil: [circle := CircleMorph new
		extent: self class circleDiameter;
		center: 0 @ 0;
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		yourself]