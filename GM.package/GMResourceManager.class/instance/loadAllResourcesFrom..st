as yet unclassified
loadAllResourcesFrom: aFilename
	self cache addAll: (((self filenamesAtDir: aFilename) 
		select: [:filename | self isSupportedType: (filename subStrings: '.') last ])
		collect: [:filename | ((filename subStrings: '.') first asSymbol) -> (self loadResourceFromDrive: filename)]).