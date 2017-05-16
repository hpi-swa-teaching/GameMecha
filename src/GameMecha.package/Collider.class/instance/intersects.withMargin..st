collision
intersects: anObject withMargin: tolerance
	"returns true, if this collider collides with a generic other one"
	
	^ self collisionGroupsIntersectWith: anObject.