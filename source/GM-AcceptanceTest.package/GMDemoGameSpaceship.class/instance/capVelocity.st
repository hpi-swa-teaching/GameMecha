game logic
capVelocity
	(self velocity squaredDistanceTo: 0 @ 0) > self class maxVelocity squared ifTrue:
		[self velocity: self velocity normalized * self class maxVelocity].