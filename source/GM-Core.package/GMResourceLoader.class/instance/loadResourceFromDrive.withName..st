loading
loadResourceFromDrive: aFilename withName: aName
	self cache at: aName put: (self resourceFromDrive: aFilename).