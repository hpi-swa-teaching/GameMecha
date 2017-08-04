accessing
resolveAllCollisions
	"check for collisions as long as anything moved (because
	there might be new collisions caused by that movement)"
	[self resolveCollisionsOnce] whileTrue.