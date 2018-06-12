as yet unclassified
registerAtGame: aGame
	self game: aGame.
	aGame addMorph: self collisionMorph.
	aGame addCollisionMorph: self collisionMorph.