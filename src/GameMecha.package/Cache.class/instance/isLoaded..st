preloading
isLoaded: path
	^ self cachedElements includesKey: (self class pathToCollection: path).