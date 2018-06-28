as yet unclassified
loadResourceFromDriveIntoCache: aString
	self cache at: (self convertToRelativePath: aString) 
		put: (self loadResourceFromDrive: aString).