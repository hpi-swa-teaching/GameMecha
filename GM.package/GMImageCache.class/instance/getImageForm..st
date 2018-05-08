accessing
getImageForm: aSymbol
	^ self imageCache at: aSymbol ifAbsent: [self error: #ImageNotLoaded]