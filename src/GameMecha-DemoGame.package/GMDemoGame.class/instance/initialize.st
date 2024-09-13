initialization
initialize
	super initialize.
	
	"We are not shipping the resources with the game but creating them on the fly on disk. Most users won't need this."
	GMDemoGameFixtures clearResourcesOnDisk.
	GMDemoGameFixtures createResourcesOnDisk.
	
	self extent: self class gameExtent;
		color: Color white;
		"the next method will allow demoGame to understand the message: isKeyPressed: aCharacter"
		gmRegisterToKeyHandler;
		initializePlanets;
		spawnPlayers.