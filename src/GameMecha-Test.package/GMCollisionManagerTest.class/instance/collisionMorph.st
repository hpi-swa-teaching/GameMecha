accessing
collisionMorph

	^ collisionMorph ifNil: [collisionMorph := GMCollisionTestMorph new]