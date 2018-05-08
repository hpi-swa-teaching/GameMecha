as yet unclassified
loadImageIntoCache: aString
	^ PNGReadWriter formFromFileNamed: (FileDirectory uri: aString) fullName