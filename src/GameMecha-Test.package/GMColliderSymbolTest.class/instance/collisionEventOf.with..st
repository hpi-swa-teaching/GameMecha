collision checks
collisionEventOf: morphA with: morphB

	self collisionManager addMorphs: {morphA. morphB}.
	^ self collisionManager collisionEventOf: morphA with: morphB