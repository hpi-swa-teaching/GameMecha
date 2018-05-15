as yet unclassified
loadAllResourcesFrom: aFilename
	self cache addAll: (((self filenamesAtDir: aFilename) 
		select: [:filename | self isSupportedType: (self extensionFromFilename: filename)])
		collect: [:filename | filename -> (self loadResourceFromDrive: filename)]).