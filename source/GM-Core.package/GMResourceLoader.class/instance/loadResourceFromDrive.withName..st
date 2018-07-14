as yet unclassified
loadResourceFromDrive: aString withName: aName
	self cache at: aName put: (self resourceFromDrive: aString).