initialize-release
initialize

	super initialize.
	self
		extent: 1500px @ 900px;
		spawnInterval: 23;
		spawnTimer: 0;
		color: Color veryLightGray;
		collisionManager: GMCollisionManager new;
		deleteQueue: Set new;
		gmRegisterToKeyHandler;
		initializeObjects;
		initializePlayers;
		clipSubmorphs: true;
		openInWindow