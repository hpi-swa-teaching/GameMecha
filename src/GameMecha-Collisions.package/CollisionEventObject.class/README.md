A CollisionEventObject is a thing that can be passed to a collision event handler.

Instance Variables
	collider1:		Collider
	collider2:		Collider
	colliderContainsOtherMap:		Dictionary
	collidersIntersect:		Boolean

collider1
	- one Morph of the collision

collider2
	- the other Morph of the collision

colliderContainsOtherMap
	- a Dictionary that gets lazily populated with the information: Does this collider contain the other?
	it has a maximum of two elements.

collidersIntersect
	- true if the colliders actually intersect, false if they just touch each other, nil if this was not calculted yet.
