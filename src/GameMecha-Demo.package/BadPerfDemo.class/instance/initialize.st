initialization
initialize
	super initialize.
	self
		bounds: (30 asPoint extent: 800 @ 600);
		collisionBehavior: (CollisionWorldBehavior newOn: self);
		createWalls;
		newBall;
		openInWorld.