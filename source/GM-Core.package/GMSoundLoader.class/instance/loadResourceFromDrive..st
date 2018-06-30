as yet unclassified
loadResourceFromDrive: aFilename
	^ (self supportedTypes at: (FileDirectory extensionFor: aFilename)
		ifAbsent: [:x | self error: #FileNotFound])
		value: (FileDirectory uri: aFilename) fullName