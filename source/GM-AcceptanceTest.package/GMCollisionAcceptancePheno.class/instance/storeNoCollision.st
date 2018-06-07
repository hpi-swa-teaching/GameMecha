collisionchecks
storeNoCollision
	self collisionChecks add: (self currentCollisionCheck shouldCollide: false).
	self addCollisionDescription: 'no collision'.