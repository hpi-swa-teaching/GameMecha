game logic
addMorph: aMorph

	super addMorph: aMorph.
	aMorph game: self.
	self collisionManager addMorph: aMorph