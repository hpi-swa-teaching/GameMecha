collision
isCollidingWithRectanglePrimitiveAABB: aRectangleCollider

	| closestX closestY dx dy rHalfW rHalfH |
	rHalfW := aRectangleCollider width / 2.0.
	rHalfH := aRectangleCollider height / 2.0.
	
	closestX := (self center x max: aRectangleCollider center x - rHalfW) min: aRectangleCollider center x + rHalfW.
	closestY := (self center y max: aRectangleCollider center y - rHalfH) min: aRectangleCollider center y + rHalfH.
	
	dx := self center x - closestX.
	dy := self center y - closestY.
	^ dx * dx + (dy * dy) <= (self radius * self radius)