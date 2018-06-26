as yet unclassified
loadResourceFromDrive: aFilename
	^ (self supportedTypes at: (self extensionFromFilename: aFilename)
		ifAbsent: [:x | self error: #FileNotFound])
		value: (FileDirectory uri: aFilename) fullName