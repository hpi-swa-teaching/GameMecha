collisionchecks
storeNoCollision
	self collisionMorph shouldCollide: false.
	self collisionChecks add: self collisionMorph currentCollisionCheck.
	self addCollisionDescription: 'no collision'.