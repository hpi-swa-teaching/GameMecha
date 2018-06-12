as yet unclassified
reset
	self submorphs do: [:aMorph | aMorph abandon].
	self collisionHandler removeAllMorphs.
	self spawnPlayer1;
		spawnPlayer2;
		initializePlanets.