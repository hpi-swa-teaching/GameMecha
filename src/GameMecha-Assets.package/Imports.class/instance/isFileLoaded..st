general
isFileLoaded: key
	^ self isLoaded: (self normalizeFileName: key).