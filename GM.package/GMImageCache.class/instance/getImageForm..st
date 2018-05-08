accessing
getImageForm: aString
	^ self imageDictionary at: aString ifAbsent: [self error: #ImageNotLoaded]