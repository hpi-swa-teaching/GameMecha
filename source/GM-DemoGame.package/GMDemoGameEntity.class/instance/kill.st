game logic
kill
	"to remove a morph properly, it has to be removed from the collision handler and from the demoGame"
	self isAlive ifTrue: 
		[self game removeCollisionMorph: self spatialMorph.
		self spatialMorph abandon.
		self isAlive: false].