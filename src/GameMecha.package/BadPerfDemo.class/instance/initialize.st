as yet unclassified
initialize
	super initialize.
	self
		bounds: (30 asPoint extent: 800 @ 600);
		createWalls;
		newBall;
		openInWorld.