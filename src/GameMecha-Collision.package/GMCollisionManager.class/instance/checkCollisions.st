collision
checkCollisions

	self morphs do: [:each | self morphs do: [:other | (self is: each collidingWith: other) ifTrue: [self notifyCollision: each with: other]]]