game logic
resolveCollisions
	(self game collisionHandler morphsCollidingWith: self collisionMorph)
		do: [:aCollisionMorph | self collidedWith: aCollisionMorph renderedMorph].