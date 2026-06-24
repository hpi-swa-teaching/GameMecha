collision
collisionEventWithCirclePrimitive: aCircleCollider

	((aCircleCollider maskIncludes: self layers) and: [self enabled = true]) ifFalse: [^ GMNullCollisionEvent new].
	
	self children do: [:collider | | event |
		event := collider collisionEventWithCirclePrimitive: aCircleCollider.
		"Note that this needs to be switched in comparison to the double dispatch layer."
		event hasCollided ifTrue: [^ GMColliderCollisionEvent newBetween: aCircleCollider and: self withReason: event]].
	
	^ GMNullCollisionEvent new