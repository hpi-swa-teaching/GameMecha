testing
shuffleMorphs
	self collisionMorphs do:
		[:aMorph | aMorph center: (self extent x atRandom) @ (self extent y atRandom) + self position]