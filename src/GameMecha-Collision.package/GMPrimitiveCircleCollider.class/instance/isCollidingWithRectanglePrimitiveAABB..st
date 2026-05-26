collision
isCollidingWithRectanglePrimitiveAABB: aRectangleCollider

	| closestX closestY dx dy rHalfW rHalfH |
	rHalfW := aRectangleCollider width / 2.0.
	rHalfH := aRectangleCollider height / 2.0.
	
	closestX := (self position x max: aRectangleCollider position x - rHalfW) min: aRectangleCollider position x + rHalfW.
	closestY := (self position y max: aRectangleCollider position y - rHalfH) min: aRectangleCollider position y + rHalfH.
	
	dx := self position x - closestX.
	dy := self position y - closestY.
	^ dx * dx + (dy * dy) <= (self radius * self radius)