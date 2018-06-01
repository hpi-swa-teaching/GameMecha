collision
shuffleMorphs
	self collisionMorphs withIndexDo:
		[:aMorph :index | aMorph position: self position + (100 @ 200) + (0 @ 200 atRandom)]