instance creation
newBetween: aCollider and: anotherCollider

	^ self new
		own: aCollider;
		other: anotherCollider;
		yourself