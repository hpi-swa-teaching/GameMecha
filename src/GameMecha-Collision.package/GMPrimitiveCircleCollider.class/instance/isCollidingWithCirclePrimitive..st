collision
isCollidingWithCirclePrimitive: aCircleCollider

	| dx dy distSquared radiiSum |
	(aCircleCollider maskIncludes: self layers) ifFalse: [^ false].
	dx := self center x - aCircleCollider center x.
	dy := self center y - aCircleCollider center y.
	distSquared := dx * dx + (dy * dy).
	radiiSum := self radius + aCircleCollider radius.
	^ distSquared <= (radiiSum * radiiSum)