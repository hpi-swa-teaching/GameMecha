accessing
smallCircle
	^ smallCircle ifNil: [smallCircle := CircleMorph new
		extent: self class smallCircleDiameter;
		gmCollisionDetectionStrategy: self strategy;
		yourself]