collision groups
collisionGroupsIntersectWith: anObject
	"return, whether this colliders collision group overlaps with the one of the passed reference object"
	
	((self usesCollisionGroups not)
		or: [anObject usesCollisionGroups not])
			ifTrue: [^ true]. "if no collision groups are used by any collision partner, they collide"
	
	^ (self collisionGroups intersection: anObject collisionGroups) isEmpty not.