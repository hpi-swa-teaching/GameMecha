test cases
testNotifyCollisionDoesNotRaiseWhenMorphHasNoOnCollision

	| plainMorph event |
	plainMorph := Morph new.
	event := GMMorphCollisionEvent
		newBetween: self morphA
		and: plainMorph
		withReason: (self morphA collider collisionEventWith: self morphA collider).
	self shouldnt: [self collisionManager notifyCollision: plainMorph with: event] raise: Error