as yet unclassified
loadAllResourcesWithNamesFrom: aFilename
	self cache addAll: (((self filenamesAtDir: aFilename) 
		select: [:filename | self isSupportedType: (self extensionFromFilename: filename)])
		collect: [:filename | ((self firstNameFromFilename: filename) asSymbol) -> (self loadResourceFromDrive: filename)]).