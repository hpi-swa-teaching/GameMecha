game logic
spawnPlayer1
	self player1: (GMDemoGameSpaceship new
		registerAtGame: self;
		controls: self controlsPlayer1;
		image: (GMDemoGameFixtures spaceship1 scaledIntoFormOfSize: GMDemoGameSpaceship defaultExtent)).
	self player1 transformationMorph 
		position: self spawnPositionPlayer1.