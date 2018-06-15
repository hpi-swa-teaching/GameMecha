game logic
registerAtGame: aGame
	self game: aGame.
	aGame 
		addMorph: self spatialMorph;
		addCollisionMorph: self spatialMorph.