as yet unclassified
loadResourceIntoCache: aString
	self cache at: ((FileDirectory uri: aString) localName) 
		put: (self loadResourceFromDrive: aString).