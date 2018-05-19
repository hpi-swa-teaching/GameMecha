collision
isCollidingWithCircle: aMorph
	^ (self owner center squaredDistanceTo: aMorph center) < ((self radius + aMorph collisionDetectionStrategy radius) squared)