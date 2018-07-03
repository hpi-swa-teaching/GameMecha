initialization
initialize
	super initialize.
	self extent: self class gameExtent;
		color: Color white;
		"the next method will allow demoGame to understand the message: isKeyPressed: aCharacter"
		registerToKeyHandler;
		initializePlanets;
		spawnPlayers.