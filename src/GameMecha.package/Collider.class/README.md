A Collider is a Decorator for Morphs that can collide.

Instance Variables
	collisionGroups:		Set
	collisionHandler:		BlockClosure
	isObstacle:		Boolean
	previousBounds:		Rectangle
	touchMargin:		Number

collisionGroups
	- The Set of collisionGroups that this Collider belongs to. If it belongs to none, it "does not want to use the collision-group-system"

collisionHandler
	-  a Block that gets executed whenever this collider collides with something else

isObstacle
	- if this is true, collisions with this collider get resolved from the CollisionWorld

previousBounds
	- the bounds this Collider had before moving (used for collision resolving)

touchMargin
	- how big (in pixels) the area around the Collider is, in that it touches other Colliders
