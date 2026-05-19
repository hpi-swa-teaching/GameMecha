collision
isCollidingWithCirclePrimitive: aCircleCollider

	(aCircleCollider maskIncludes: self layers) ifFalse: [^ false].
	^ self notYetImplemented