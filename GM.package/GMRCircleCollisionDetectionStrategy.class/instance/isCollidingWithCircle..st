collision
isCollidingWithCircle: aMorph
	|oppositeCollisionDetectionStrategy|
	oppositeCollisionDetectionStrategy := aMorph collisionDetectionStrategy.
	^ (self center squaredDistanceTo: oppositeCollisionDetectionStrategy center) < ((self radius + oppositeCollisionDetectionStrategy radius) squared)