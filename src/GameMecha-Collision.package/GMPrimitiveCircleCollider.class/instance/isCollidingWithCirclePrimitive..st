collision
isCollidingWithCirclePrimitive: aCircleCollider

	| dx dy distSquared radiiSum |
	(aCircleCollider maskIncludes: self layers) ifFalse: [^ false].
	dx := self position x - aCircleCollider position x.
	dy := self position y - aCircleCollider position y.
	distSquared := dx * dx + (dy * dy).
	radiiSum := self radius + aCircleCollider radius.
	^ distSquared <= (radiiSum * radiiSum)