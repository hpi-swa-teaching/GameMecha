accessing
smallCircle
	^ smallCircle ifNil: [smallCircle := CircleMorph new
		extent: self class smallCircleDiameter;
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		yourself]