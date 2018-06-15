game logic
kill
	self isAlive ifTrue: 
		[self game removeCollisionMorph: self spatialMorph.
		self spatialMorph abandon.
		self isAlive: false].