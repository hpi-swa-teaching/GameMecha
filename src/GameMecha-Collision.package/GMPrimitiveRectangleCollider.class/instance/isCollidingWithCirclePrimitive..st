collision
isCollidingWithCirclePrimitive: aCircleCollider

	(aCircleCollider maskIncludes: self layers) ifFalse: [^ false].
	self rotation abs <= 1.0e-10 ifTrue: [^ self isCollidingWithCirclePrimitiveAABB: aCircleCollider].
	^ self isCollidingWithCirclePrimitiveRotated: aCircleCollider