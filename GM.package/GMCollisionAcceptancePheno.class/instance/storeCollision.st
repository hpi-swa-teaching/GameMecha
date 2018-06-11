collisionchecks
storeCollision
	self collisionChecks add: (self collisionMorph currentCollisionCheck 
		shouldCollide: true;
		yourself).
	self addCollisionDescription: 'collision'.
	