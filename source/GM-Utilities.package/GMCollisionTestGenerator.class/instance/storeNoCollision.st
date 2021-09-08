collision checks
storeNoCollision
	self collisionMorph shouldCollide: false.
	self collisionChecks add: self collisionMorph currentCollisionCheck.