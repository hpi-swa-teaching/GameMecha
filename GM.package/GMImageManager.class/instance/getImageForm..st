accessing
getImageForm: aSymbol
	^ self cache at: aSymbol ifAbsent: [self error: #ImageNotLoaded]