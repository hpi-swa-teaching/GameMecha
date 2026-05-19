collision
isCollidingWithRectanglePrimitive: aRectangleCollider

	(aRectangleCollider maskIncludes: self layers) ifFalse: [^ false].
	^ self notYetImplemented