collisionchecks
storeCollision
	self collisionChecks add: (self currentCollisionCheck shouldCollide: true).
	self addCollisionDescription: 'collision'.
	