as yet unclassified
get: path
	^ self cachedElements
		at: (self class pathToCollection: path)
		ifAbsentPut: [self loadElement: path].