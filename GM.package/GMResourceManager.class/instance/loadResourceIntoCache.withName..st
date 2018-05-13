as yet unclassified
loadResourceIntoCache: aString withName: aSymbol
	self cache at: aSymbol put: (self loadResourceFromDrive: aString).