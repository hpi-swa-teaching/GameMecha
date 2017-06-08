obstacle
denyMovingColliderIntoOurself: otherCollider
	| delta ppBounds|
	delta := otherCollider bounds origin - otherCollider previousBounds origin.
	otherCollider position: (otherCollider position x @ otherCollider previousBounds origin y).
	self resolveIntersection: otherCollider movingVector: (delta x @ 0).
	ppBounds := otherCollider previousBounds.
	otherCollider previousBounds: otherCollider bounds copy.
	otherCollider position: (otherCollider position + (0 @ delta y)).
	self resolveIntersection: otherCollider movingVector: (0 @ delta y).
	otherCollider previousBounds: ppBounds.