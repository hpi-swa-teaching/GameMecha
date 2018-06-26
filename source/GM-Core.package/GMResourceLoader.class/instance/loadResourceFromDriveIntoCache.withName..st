as yet unclassified
loadResourceFromDriveIntoCache: aString withName: aName
	self cache at: aName put: (self loadResourceFromDrive: aString).