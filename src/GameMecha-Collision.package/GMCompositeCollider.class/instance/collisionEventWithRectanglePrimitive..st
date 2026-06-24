collision
collisionEventWithRectanglePrimitive: aRectangleCollider

	((aRectangleCollider maskIncludes: self layers) and: [self enabled = true]) ifFalse: [^ GMNullCollisionEvent new].
	
	self children do: [:collider | | event |
		event := collider collisionEventWithRectanglePrimitive: aRectangleCollider.
		"Note that this needs to be switched in comparison to the double dispatch layer."
		event hasCollided ifTrue: [^ GMColliderCollisionEvent newBetween: aRectangleCollider and: self withReason: event]].
	
	^ GMNullCollisionEvent new