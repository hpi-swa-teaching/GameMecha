accessing
collisionManager

	^ collisionManager ifNil: [collisionManager := GMCollisionManager new]