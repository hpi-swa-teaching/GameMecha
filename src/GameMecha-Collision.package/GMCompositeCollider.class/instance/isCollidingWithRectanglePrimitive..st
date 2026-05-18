collision
isCollidingWithRectanglePrimitive: aRectangleCollider

	^ self children
		detect: [:collider | collider isCollidingWithRectanglePrimitive: aRectangleCollider]
		ifNone: [^ false]