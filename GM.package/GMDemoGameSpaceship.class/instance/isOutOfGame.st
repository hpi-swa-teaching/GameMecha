game logic
isOutOfGame
	^ (self game collisionHandler is: self transformationMorph collidingWith: self game) not