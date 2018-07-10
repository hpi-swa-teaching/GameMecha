accessing
collisionHandler
	^ collisionHandler ifNil: [collisionHandler := GMCollisionHandler new]