as yet unclassified
loadResourceFromDrive: aString
	self cache at: (self convertToRelativePath: aString) 
		put: (self resourceFromDrive: aString).