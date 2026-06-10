collision
collisionEventWithCirclePrimitive: aCircleCollider

	| useAABB collision |
	((aCircleCollider maskIncludes: self layers) and: [self enabled = true]) ifFalse: [^ GMNullCollisionEvent new].
	
	useAABB := aCircleCollider rotation abs <= self rotationCalculationThreshold and: [self rotation abs <= self rotationCalculationThreshold].
	
	collision := useAABB
		ifTrue: [self checkCollisionWithCirclePrimitiveAABB: aCircleCollider]
		ifFalse: [self checkCollisionWithCirclePrimitiveRotated: aCircleCollider].
	collision ifTrue: [^ GMPrimitiveColliderCollisionEvent newBetween: self and: aCircleCollider].
	
	^ GMNullCollisionEvent new