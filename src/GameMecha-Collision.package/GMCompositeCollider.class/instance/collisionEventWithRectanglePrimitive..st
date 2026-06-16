collision
collisionEventWithRectanglePrimitive: aRectangleCollider

	((aRectangleCollider maskIncludes: self layers) and: [self enabled = true]) ifFalse: [^ GMNullCollisionEvent new].
	
	self children do: [:collider | | event |
		event := collider collisionEventWithRectanglePrimitive: aRectangleCollider.
		event hasCollided ifTrue: [^ GMColliderCollisionEvent newBetween: self and: aRectangleCollider withReason: event]].
	
	^ GMNullCollisionEvent new