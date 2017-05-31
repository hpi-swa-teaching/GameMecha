obstacle
denyMovingColliderIntoOurself: otherCollider
	| delta |
	delta := otherCollider bounds origin - otherCollider previousBounds origin.
	otherCollider position: (otherCollider position x @ otherCollider previousBounds origin y).
	self resolveIntersection: otherCollider movingVector: (delta x @ 0).
	otherCollider previousBounds: otherCollider bounds copy.
	otherCollider position: (otherCollider position + (0 @ delta y)).
	self resolveIntersection: otherCollider movingVector: (0 @ delta y).