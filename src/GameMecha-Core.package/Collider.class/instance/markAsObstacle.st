obstacle
markAsObstacle
	self isObstacle: true.
	self registerCollisionHandler: [:collisionEvent | self denyMovingColliderIntoOurself: (collisionEvent collisionPartnerOf: self)].