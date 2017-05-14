stepping
step
	"check for collisions between all submorphs each step"
	super step.
	1 to: self submorphs size do: 
		[:i | i + 1 to: self submorphs size do:
			[:o | self testCollisionBetween: (self submorphs at:i) and: (self submorphs at:o)]].