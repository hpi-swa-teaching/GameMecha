instance creation
newBetween: aMorph and: anotherMorph withReason: aCollisionEvent

	^ self new
		own: aMorph;
		other: anotherMorph;
		reason: aCollisionEvent;
		yourself