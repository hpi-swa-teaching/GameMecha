collision
isCollidingWithRectanglePrimitive: aRectangleCollider

	(aRectangleCollider maskIncludes: self layers) ifFalse: [^ false].
	^ self children anySatisfy: [:collider | collider isCollidingWithCirclePrimitive: aRectangleCollider]