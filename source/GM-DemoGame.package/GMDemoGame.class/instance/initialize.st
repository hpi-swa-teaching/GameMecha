initialization
initialize
	super initialize.
	self extent: self class gameExtent;
		color: Color white;
		gmRegisterToKeyHandler;
		initializePlanets;
		spawnPlayers.