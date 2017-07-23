imageList
imageAtCoordinates: coordinates
	^ self imports
		get: (self cacheKeyOfSprite: coordinates)
		ifAbsentPut: [self computeSpriteAt: coordinates].