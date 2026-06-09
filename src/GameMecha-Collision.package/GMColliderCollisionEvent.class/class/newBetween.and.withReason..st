instance creation
newBetween: aCollider and: anotherCollider withReason: aCollisionEvent

	^ self new
		own: aCollider;
		other: anotherCollider;
		reason: aCollisionEvent;
		yourself