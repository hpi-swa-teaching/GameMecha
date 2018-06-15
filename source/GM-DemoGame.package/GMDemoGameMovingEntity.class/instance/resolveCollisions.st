game logic
resolveCollisions
	(self game collisionHandler morphsCollidingWith: self spatialMorph)
		do: [:aCollisionMorph | self collidedWith: aCollisionMorph renderedMorph].