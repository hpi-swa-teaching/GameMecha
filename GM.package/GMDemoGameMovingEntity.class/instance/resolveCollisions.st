game logic
resolveCollisions
	(self game collisionHandler morphsCollidingWith: self collisionMorph)
		do: [:aCollisionMorph | 
			Transcript show: aCollisionMorph.
			self collidedWith: aCollisionMorph renderedMorph].