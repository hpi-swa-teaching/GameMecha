collision
isCollidingWithCirclePrimitive: aCircleCollider

	(aCircleCollider maskIncludes: self layers) ifFalse: [^ false].
	^ self children anySatisfy: [:collider | collider isCollidingWithCirclePrimitive: aCircleCollider]