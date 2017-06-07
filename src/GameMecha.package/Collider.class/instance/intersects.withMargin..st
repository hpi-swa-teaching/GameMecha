collision
intersects: anObject withMargin: tolerance
	"returns true, if this collider collides with a generic other one and the boundingboxes intersect"
	
	^ (self collisionGroupsIntersectWith: anObject)
		and: [(self bounds expandBy: tolerance) intersects: (anObject bounds expandBy: tolerance)].