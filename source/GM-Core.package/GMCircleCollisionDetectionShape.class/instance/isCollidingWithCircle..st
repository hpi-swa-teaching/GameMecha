collision
isCollidingWithCircle: aMorph
	^ (self owner center squaredDistanceTo: aMorph center) < ((self radius + aMorph gmCollisionDetectionShape radius) squared)