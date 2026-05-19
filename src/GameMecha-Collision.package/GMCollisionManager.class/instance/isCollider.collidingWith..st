collision
isCollider: aCollider collidingWith: anotherCollider

	^ (self shouldCheckCollisionBetweenColliders: aCollider and: anotherCollider) and: [aCollider isCollidingWith: anotherCollider]