as yet unclassified
registerAtGame: aGame
	self game: aGame.
	aGame addMorph: self.
	aGame addCollisionMorph: self.