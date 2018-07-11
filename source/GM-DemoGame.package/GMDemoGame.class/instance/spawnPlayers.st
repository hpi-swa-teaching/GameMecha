game logic
spawnPlayers
	self spawnPlayerWithControls: self controlsPlayer1
		andForm: (self imageLoader at: GMDemoGameFixtures spaceship1Path withSize: GMDemoGameSpaceship defaultExtent)
		at: self class spawnPositionPlayer1.
	(self spawnPlayerWithControls: self controlsPlayer2
		andForm: (self imageLoader at: GMDemoGameFixtures spaceship2Path withSize: GMDemoGameSpaceship defaultExtent)
		at: self class spawnPositionPlayer2)
		transformationMorph angle: Float pi.