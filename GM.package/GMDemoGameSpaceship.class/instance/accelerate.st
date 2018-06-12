control
accelerate
	self velocity: self velocity 
		+ (self class accelerationSpeed @ 0 rotateBy: self transformationMorph angle about: 0 @ 0).
	(self velocity squaredDistanceTo: 0 @ 0) > self class maxVelocity squared ifTrue:
		[self velocity: self velocity normalized * self class maxVelocity].