*GM-Collision
collisionDetectionStrategy: aCollisionDetectionStrategy
	self assureExtension assureOtherProperties at: #collisionDetectionStrategy put: aCollisionDetectionStrategy.
	aCollisionDetectionStrategy owner: self.