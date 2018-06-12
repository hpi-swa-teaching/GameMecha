game logic
registerAtGame: aGame
	self game: aGame.
	aGame addMorph: self spatialMorph.
	aGame addCollisionMorph: self spatialMorph.