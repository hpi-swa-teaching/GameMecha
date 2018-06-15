game logic
resetPlayers
	self players do: [:aPlayer | aPlayer kill].
	self spawnPlayers.