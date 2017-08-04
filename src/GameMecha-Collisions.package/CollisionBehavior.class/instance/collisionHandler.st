accessing
collisionHandler
	collisionHandler ifNil: [self collisionHandler: [:event|]].
	^ collisionHandler.