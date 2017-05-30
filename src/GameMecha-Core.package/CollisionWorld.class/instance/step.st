stepping
step
	"Let all submorphs step. Then finish the current movement cycle by resolving collisions and letting each collider fetch their current bounds again"

	self submorphs do: [:sub | sub step].
	1 to: self submorphs size do: 
		[:i | i + 1 to: self submorphs size do:
			[:o | self testCollisionBetween: (self submorphs at:i) and: (self submorphs at:o)]].
	self submorphs do: [:sub | sub fetchPreviousBounds].