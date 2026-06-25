test cases
testNotifyCollisionDoesNotRaiseWhenMorphHasNoOnCollision

	| plainMorph event |
	plainMorph := Morph new.
	event := GMMorphCollisionEvent
		newBetween: morphA
		and: plainMorph
		withReason: (morphA collider collisionEventWith: morphA collider).
	self shouldnt: [self collisionManager notifyCollision: plainMorph with: event] raise: Error