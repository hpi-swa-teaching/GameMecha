collision
collisionEventWith: aCollider

	(self maskIncludes: aCollider layers) ifFalse: [^ GMNullCollisionEvent new].
	
	self children do: [:collider | | event |
		event := collider collisionEventWith: aCollider.
		event hasCollided ifTrue: [^ GMColliderCollisionEvent newBetween: self and: aCollider withReason: event]].
	
	^ GMNullCollisionEvent new