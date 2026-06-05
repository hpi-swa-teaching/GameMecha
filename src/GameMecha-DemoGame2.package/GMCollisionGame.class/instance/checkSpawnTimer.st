game logic
checkSpawnTimer

	self spawnTimer \\ self spawnInterval = 0 ifTrue: [self spawnEnemy].
	self spawnTimer: self spawnTimer + 1