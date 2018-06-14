game logic
kill
	self isAlive ifTrue: 
		[self game removeMorph: self collisionMorph.
		self abandon.
		self isAlive: false].