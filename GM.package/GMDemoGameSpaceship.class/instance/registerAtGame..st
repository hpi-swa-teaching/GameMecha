as yet unclassified
registerAtGame: aGame
	self game: aGame.
	aGame addMorph: self transformationMorph.
	aGame addCollisionMorph: self transformationMorph.