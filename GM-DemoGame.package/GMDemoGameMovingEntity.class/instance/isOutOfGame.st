game logic
isOutOfGame
	^ (self spatialMorph bounds intersects: self game bounds) not