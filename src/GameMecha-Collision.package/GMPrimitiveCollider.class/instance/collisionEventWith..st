collision
collisionEventWith: aCollider

	(self maskIncludes: aCollider layers) ifFalse: [^ GMNullCollisionEvent new].
	
	^ self dispatchPrimitiveCollision: aCollider