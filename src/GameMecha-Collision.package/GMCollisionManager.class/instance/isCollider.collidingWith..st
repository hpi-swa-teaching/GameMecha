collision
isCollider: aCollider collidingWith: anotherCollider

	^ (aCollider ~~ anotherCollider) and: [aCollider isCollidingWith: anotherCollider]