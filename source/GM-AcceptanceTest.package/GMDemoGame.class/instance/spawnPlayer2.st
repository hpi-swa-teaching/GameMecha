initialization
spawnPlayer2
	self player2: (GMDemoGameSpaceship new
		registerAtGame: self;
		controls: self controlsPlayer2).
	self player2 transformationMorph 
		position: self spawnPositionPlayer2;
		angle: Float pi.