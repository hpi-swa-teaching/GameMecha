collisionchecks
storeNoCollision
	self collisionChecks add: (self collisionMorph currentCollisionCheck 
		shouldCollide: false;
		yourself).
	self addCollisionDescription: 'no collision'.