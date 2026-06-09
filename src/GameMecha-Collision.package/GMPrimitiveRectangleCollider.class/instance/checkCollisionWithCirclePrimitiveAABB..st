collision
checkCollisionWithCirclePrimitiveAABB: aCircleCollider

	| closestX closestY dx dy rHalfW rHalfH |
	rHalfW := self width / 2.0.
	rHalfH := self height / 2.0.
	
	closestX := (aCircleCollider center x max: self center x - rHalfW) min: self center x + rHalfW.
	closestY := (aCircleCollider center y max: self center y - rHalfH) min: self center y + rHalfH.
	
	dx := aCircleCollider center x - closestX.
	dy := aCircleCollider center y - closestY.
	
	^ dx * dx + (dy * dy) <= (aCircleCollider radius * aCircleCollider radius)