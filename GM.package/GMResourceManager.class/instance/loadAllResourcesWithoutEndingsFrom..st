as yet unclassified
loadAllResourcesWithoutEndingsFrom: aFoldername
	self cache addAll: (((self filenamesAtDir: aFoldername) 
		select: [:filename | self isSupportedType: (self extensionFromFilename: filename)])
		collect: [:filename | self firstNameFromFilename: filename -> (self loadResourceFromDrive: aFoldername , filename)]).