obstacle
denyMovingColliderIntoOurself: otherCollider
	"otherDirection := otherCollider bounds position - otherCollider previousBounds position."
	otherCollider bounds: otherCollider previousBounds.