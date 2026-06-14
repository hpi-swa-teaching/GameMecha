collision
collisionEventWith: aCollider

	((self maskIncludes: aCollider layers) and: [self enabled = true]) ifFalse: [^ GMNullCollisionEvent new].
	
	^ self dispatchPrimitiveCollision: aCollider