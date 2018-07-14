as yet unclassified
resourceFromDrive: aFilename
	^ (self supportedTypes at: (FileDirectory extensionFor: aFilename)
		ifAbsent: [:x | self error: #FileNotFound])
		value: (FileDirectory uri: aFilename) fullName