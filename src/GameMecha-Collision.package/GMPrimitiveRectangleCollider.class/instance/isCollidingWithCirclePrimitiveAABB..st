collision
isCollidingWithCirclePrimitiveAABB: aCircleCollider

	| closestX closestY dx dy rHalfW rHalfH |
	rHalfW := self width / 2.0.
	rHalfH := self height / 2.0.
	
	closestX := (aCircleCollider position x max: self position x - rHalfW) min: self position x + rHalfW.
	closestY := (aCircleCollider position y max: self position y - rHalfH) min: self position y + rHalfH.
	
	dx := aCircleCollider position x - closestX.
	dy := aCircleCollider position y - closestY.
	^ dx * dx + (dy * dy) <= (aCircleCollider radius * aCircleCollider radius)