as yet unclassified
loadAllResourcesWithoutEndingsFrom: aFoldername
	self cache addAll: (((self filenamesAtDir: aFoldername) 
		select: [:filename | self isSupportedType: (self extensionFromFilename: filename)])
		collect: [:filename | (filename subStrings: '.') first -> (self loadResourceFromDrive: aFoldername , filename)]).