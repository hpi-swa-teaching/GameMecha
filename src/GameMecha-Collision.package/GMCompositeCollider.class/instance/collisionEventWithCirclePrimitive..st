collision
collisionEventWithCirclePrimitive: aCircleCollider

	(aCircleCollider maskIncludes: self layers) ifFalse: [^ GMNullCollisionEvent new].
	
	self children do: [:collider | | event |
		event := collider collisionEventWithCirclePrimitive: aCircleCollider.
		event hasCollided ifTrue: [^ GMColliderCollisionEvent newBetween: self and: aCircleCollider withReason: event]].
	
	^ GMNullCollisionEvent new