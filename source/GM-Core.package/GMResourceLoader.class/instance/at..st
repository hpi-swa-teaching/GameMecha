as yet unclassified
at: aString
	^ self cache at: (self convertToRelativePath: aString) ifAbsent: [self error: #ResourceNotLoaded]