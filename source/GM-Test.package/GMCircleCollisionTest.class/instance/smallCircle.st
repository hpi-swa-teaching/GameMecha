accessing
smallCircle
	^ smallCircle ifNil: [smallCircle := CircleMorph new
		extent: self class smallCircleDiameter;
		collisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		yourself]