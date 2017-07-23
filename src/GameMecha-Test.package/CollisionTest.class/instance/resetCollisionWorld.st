supporting
resetCollisionWorld
	self collisionWorld ifNotNil: [self collisionWorld delete].
	self collisionWorld: nil.