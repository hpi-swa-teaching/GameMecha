as yet unclassified
loadAllImagesFrom: aFilename
	self imageCache addAll: (((self imageFilenamesAtDir: aFilename) 
		select: [:filename | self isSupportedType: (filename subStrings: '.') last ])
		collect: [:filename | ((filename subStrings: '.') first asSymbol) -> (self loadFormFromDrive: filename)]).