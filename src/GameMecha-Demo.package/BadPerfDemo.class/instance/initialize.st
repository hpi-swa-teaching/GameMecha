initialization
initialize
	super initialize.
	self
		bounds: (30 asPoint extent: 800 @ 600);
		collisionWorldBehavior: (CollisionWorldBehavior newOn: self);
		createWalls;
		newBall;
		openInWorld.