as yet unclassified
loadResourceFromDrive: aFilename
	self cache at: (self convertToRelativePath: aFilename) 
		put: (self resourceFromDrive: aFilename).