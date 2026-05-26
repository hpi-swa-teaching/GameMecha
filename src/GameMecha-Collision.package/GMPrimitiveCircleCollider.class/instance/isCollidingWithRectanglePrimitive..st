collision
isCollidingWithRectanglePrimitive: aRectangleCollider

	(aRectangleCollider maskIncludes: self layers) ifFalse: [^ false].
	aRectangleCollider rotation abs <= 1.0e-10 ifTrue: [^ self isCollidingWithRectanglePrimitiveAABB: aRectangleCollider].
	^ self isCollidingWithRectanglePrimitiveRotated: aRectangleCollider
	