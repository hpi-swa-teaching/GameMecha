as yet unclassified
loadResourceFromDriveIntoCache: aString
	self cache at: ((FileDirectory uri: aString) localName) 
		put: (self loadResourceFromDrive: aString).