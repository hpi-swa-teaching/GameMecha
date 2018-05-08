accessing
getImageForm: aSymbol
	^ self imageCache at: (aSymbol asString ,'.png') ifAbsent: [self error: #ImageNotLoaded]