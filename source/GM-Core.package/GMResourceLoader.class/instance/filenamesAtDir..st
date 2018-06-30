as yet unclassified
filenamesAtDir: aString
	^ (FileDirectory uri: aString) fileNames
		select: [:filename | self isSupportedType: (FileDirectory extensionFor: filename)]