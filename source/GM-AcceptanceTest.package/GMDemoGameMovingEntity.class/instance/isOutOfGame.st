game logic
isOutOfGame
	^ (self collisionMorph bounds intersects: self game bounds) not