accessing
getImageForm: aString
	^ self cache at: aString ifAbsent: [self error: #ImageNotLoaded]