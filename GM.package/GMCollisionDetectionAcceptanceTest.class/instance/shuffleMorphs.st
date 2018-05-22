testing
shuffleMorphs
	self collisionMorphs do:
		[:aMorph | aMorph center: (self extent x random) @ (self extent y random) + self position]