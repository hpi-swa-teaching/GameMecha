as yet unclassified
loadResourceIntoCache: aString withName: aName
	self cache at: aName put: (self loadResourceFromDrive: aString).