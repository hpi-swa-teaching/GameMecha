initialization
spawnPlayer1
	self player1: (GMDemoGameSpaceship new
		registerAtGame: self;
		controls: self controlsPlayer1).
	self player1 transformationMorph 
		position: self spawnPositionPlayer1.