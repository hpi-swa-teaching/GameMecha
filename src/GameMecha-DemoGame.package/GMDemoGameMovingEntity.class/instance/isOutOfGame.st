game logic
isOutOfGame
	"this simple check does not require precision, so we decided not to use the collision detection"
	^ (self spatialMorph bounds intersects: self game bounds) not