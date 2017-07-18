general
isLoaded: key
	^ imports includesKey: (self normalizeFileName: key).