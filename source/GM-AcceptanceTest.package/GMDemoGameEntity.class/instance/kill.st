game logic
kill
	self flag: #avoidDyingMoreThanOnce.
	self game removeMorph: self.
	self abandon.