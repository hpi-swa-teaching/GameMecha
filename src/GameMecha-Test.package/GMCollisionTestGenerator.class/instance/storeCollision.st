collision checks
storeCollision
	self collisionMorph shouldCollide: true.
	self collisionChecks add: self collisionMorph currentCollisionCheck.
	