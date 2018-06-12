game logic
isOutOfGame
	^ (self game collisionHandler is: self collidingWith: self game) not