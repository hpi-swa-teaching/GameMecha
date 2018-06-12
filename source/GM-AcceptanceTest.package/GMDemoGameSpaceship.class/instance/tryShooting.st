control
tryShooting
	self cooldownCounter isZero ifTrue: 
		[self spawnProjectile.
		self cooldownCounter: self class numberOfCooldownSteps].