game logic
spawnEnemy

	| enemy |
	enemy := GMCollisionGameEnemy new.
	self 
		generateRandomPositionAndDirectionOf: enemy;
		addMorph: enemy