as yet unclassified
loadResourceFromDrive: aString
	^ Form fromFileNamed: (FileDirectory uri: aString) fullName