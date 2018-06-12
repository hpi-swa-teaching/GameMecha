game logic
kill
	self isAlive ifTrue: 
		[self game removeCollisionMorph: self collisionMorph.
		self transformationMorph abandon.
		self isAlive: false].