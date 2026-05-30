collision
isCollidingWithRectanglePrimitive: aRectangleCollider

(aRectangleCollider maskIncludes: self layers) ifFalse: [^ false].
	(self rotation abs <= 1.0e-10 and: [aRectangleCollider rotation abs <= 1.0e-10]) ifTrue: [^ self isCollidingWithRectanglePrimitiveAABB: aRectangleCollider].
	^ self isCollidingWithRectanglePrimitiveRotated: aRectangleCollider