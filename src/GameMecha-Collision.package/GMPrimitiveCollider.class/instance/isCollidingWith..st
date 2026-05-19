collision
isCollidingWith: aCollider

	^ (self maskIncludes: aCollider layers)
		ifTrue: [self dispatchPrimitiveCollision: aCollider]
		ifFalse: [false]