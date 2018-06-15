game logic
spawnPlayers
	self spawnPlayerWithControls: self controlsPlayer1 
		andForm: (GMDemoGameFixtures spaceship1 scaledIntoFormOfSize: GMDemoGameSpaceship defaultExtent)
		at: self class spawnPositionPlayer1.
	(self spawnPlayerWithControls: self controlsPlayer2
		andForm: (GMDemoGameFixtures spaceship2 scaledIntoFormOfSize: GMDemoGameSpaceship defaultExtent)
		at: self class spawnPositionPlayer2)
		transformationMorph angle: Float pi.