game logic
registerAtGame: aGame
	"to add a morph to the game, it has to be added as a submorph of the GMDemoGame instance and it has to be registered at the collisionHandler if it is supposed to be involved in collisions"
	self game: aGame.
	aGame 
		addMorph: self spatialMorph;
		addCollisionMorph: self spatialMorph.