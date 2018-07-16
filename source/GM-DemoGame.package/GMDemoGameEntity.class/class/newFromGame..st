instance creation
newFromGame: aGame
	^ self basicNew
		game: aGame;
		initialize