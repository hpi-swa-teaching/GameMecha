initialization
initialize
	super initialize.
	self 
		extent: 1500 @ 900;
		color: Color white.
	self gmRegisterToKeyHandler.
	self initializePlanets.
	self spawnPlayer1.
	self spawnPlayer2.