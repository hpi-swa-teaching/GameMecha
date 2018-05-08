as yet unclassified
registerImage: aString underName: aSymbol
	^ PNGReadWriter formFromFileNamed: (FileDirectory uri:  aString) fullName