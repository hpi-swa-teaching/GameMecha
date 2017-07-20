subImages
computeSpriteAt: coordinates
	^ self spriteForm
		contentsOfArea: (self coordinatesToBounds: coordinates).