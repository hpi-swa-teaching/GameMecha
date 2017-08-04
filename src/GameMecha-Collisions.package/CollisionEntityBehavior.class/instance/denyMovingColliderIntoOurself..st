accessing
denyMovingColliderIntoOurself: otherCollider
	|delta prevBounds|
	delta := otherCollider bounds origin - otherCollider collisionBehavior previousBounds origin.
	otherCollider position: (otherCollider position x @ otherCollider collisionBehavior previousBounds origin y).
	self resolveIntersection: otherCollider movingVector: (delta x @ 0).
	prevBounds := otherCollider collisionBehavior previousBounds.
	otherCollider collisionBehavior previousBounds: otherCollider bounds copy.
	otherCollider position: (otherCollider position + (0 @ delta y)).
	self resolveIntersection: otherCollider movingVector: (0 @ delta y).
	otherCollider collisionBehavior previousBounds: prevBounds.