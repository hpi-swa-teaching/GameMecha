as yet unclassified
loadImageIntoCache: aString withName: aSymbol
	self imageCache at: aSymbol put: (self loadFormFromDrive: aString).