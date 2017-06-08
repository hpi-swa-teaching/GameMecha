stepping
resolveCollisionsOnce
	"check each pair of colliders once and check for collisions between them"
	"returns true, if any of the colliders moved in the process"
	| movedColliders |
	movedColliders := false.
	1 to: self submorphs size do: 
		[:i | i + 1 to: self submorphs size do:
			[:o | movedColliders := movedColliders 
				or: (self testCollisionBetween: (self submorphs at:i) and: (self submorphs at:o))]].
	^ movedColliders.