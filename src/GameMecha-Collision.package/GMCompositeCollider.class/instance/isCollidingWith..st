collision
isCollidingWith: aCollider

	^ self children detect: [:collider | collider isCollidingWith: aCollider] ifNone: [^ false]