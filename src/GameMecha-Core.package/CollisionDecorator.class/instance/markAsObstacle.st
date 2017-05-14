accessing
markAsObstacle
	isObstacle := true.
	self
		registerCollisionHandler: [:collisionEvent | self isObstacle
				ifTrue: [self
						denyMovingColliderIntoOurself: (collisionEvent collisionPartnerOf: self)]].