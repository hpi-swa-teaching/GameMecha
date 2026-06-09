collision
checkCollisionWithCirclePrimitiveAABB: aCircleCollider

	| dx dy distSquared radiiSum |
	dx := self center x - aCircleCollider center x.
	dy := self center y - aCircleCollider center y.
	
	"Here we have to watch out for operator precedence!"
	distSquared := (dx * dx) + (dy * dy).
	radiiSum := self radius + aCircleCollider radius.
	
	^ distSquared <= (radiiSum * radiiSum)