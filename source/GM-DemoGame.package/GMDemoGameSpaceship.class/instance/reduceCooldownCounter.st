game logic
reduceCooldownCounter
	self cooldownCounter: (self cooldownCounter - 1 max: 0).