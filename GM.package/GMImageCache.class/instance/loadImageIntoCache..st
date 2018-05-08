as yet unclassified
loadImageIntoCache: aString
	self imageCache at: (((FileDirectory uri: aString) localName subStrings: '.') first asSymbol) 
		put: (self loadFormFromDrive: aString).