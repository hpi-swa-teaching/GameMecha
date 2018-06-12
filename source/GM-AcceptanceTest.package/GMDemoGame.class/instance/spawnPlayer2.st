game logic
spawnPlayer2
	self player2: (GMDemoGameSpaceship new
		registerAtGame: self;
		controls: self controlsPlayer2;
		image: (GMDemoGameFixtures spaceship2 scaledIntoFormOfSize: GMDemoGameSpaceship defaultExtent)).
	self player2 transformationMorph 
		position: self spawnPositionPlayer2;
		angle: Float pi.