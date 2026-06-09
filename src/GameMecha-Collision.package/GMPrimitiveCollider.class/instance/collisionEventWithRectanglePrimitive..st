collision
collisionEventWithRectanglePrimitive: aRectangleCollider

	| useAABB collision |
	(aRectangleCollider maskIncludes: self layers) ifFalse: [^ GMNullCollisionEvent new].
	
	useAABB := aRectangleCollider rotation abs <= self rotationCalculationThreshold.
	
	collision := useAABB
		ifTrue: [self checkCollisionWithRectanglePrimitiveAABB: aRectangleCollider]
		ifFalse: [self checkCollisionWithRectanglePrimitiveRotated: aRectangleCollider].
	collision ifTrue: [^ GMPrimitiveColliderCollisionEvent newBetween: self and: aRectangleCollider].
	
	^ GMNullCollisionEvent new