collision groups
collisionGroupsIntersectWith: otherMorph
	"return, whether my collision group overlaps with the one of the passed reference object"
	
	((self usesCollisionGroups not)
		or: [otherMorph collisionBehavior usesCollisionGroups not])
			ifTrue: [^ true]. "if no collision groups are used by any collision partner, they collide"
	
	^ (self collisionGroups intersection: otherMorph collisionBehavior collisionGroups) isEmpty not.