collision
intersects: anObject
	"returns true, if this collider collides with a generic other one"
	
	^ self collisionGroupsIntersectWith: anObject.