accessing
computeSpriteAt: coordinates
	^ (self imports get: self fileName)
		contentsOfArea: (self coordinatesToBounds: coordinates).