collision
isCollidingWithCirclePrimitive: aCircleCollider

	^ self children
		detect: [:collider | collider isCollidingWithCirclePrimitive: aCircleCollider]
		ifNone: [^ false]