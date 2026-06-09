collision
checkCollisions

	self morphs do: [:each |
		self morphs do: [:other | | event |
			event := self collisionEventOf: each with: other.
			event hasCollided ifTrue: [self notifyCollision: each with: event]]]