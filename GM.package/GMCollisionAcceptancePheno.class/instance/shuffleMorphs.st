collision
shuffleMorphs
	self collisionMorphs do:
		[:aMorph | aMorph position: self position + (100 @ 200) + (0 @ 200 atRandom)]