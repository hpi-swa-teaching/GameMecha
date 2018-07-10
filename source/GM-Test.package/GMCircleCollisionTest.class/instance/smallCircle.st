accessing
smallCircle
	^ smallCircle ifNil: [smallCircle := CircleMorph new
		extent: self class smallCircleDiameter;
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		yourself]