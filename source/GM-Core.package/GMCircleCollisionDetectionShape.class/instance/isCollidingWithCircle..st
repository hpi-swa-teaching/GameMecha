collision
isCollidingWithCircle: aMorph
	self flag: #refactor.
	^ (self owner center squaredDistanceTo: aMorph center) < ((self radius + aMorph collisionDetectionStrategy radius) squared)