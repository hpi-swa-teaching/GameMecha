as yet unclassified
getSpriteSheet: path
	^ self cachedElements
		at: (self class pathToCollection: path).