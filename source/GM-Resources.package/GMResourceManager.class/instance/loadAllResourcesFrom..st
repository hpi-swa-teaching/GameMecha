as yet unclassified
loadAllResourcesFrom: aFoldername
	self cache addAll: (((self filenamesAtDir: aFoldername) 
		select: [:filename | self isSupportedType: (self extensionFromFilename: filename)])
		collect: [:filename | filename -> (self loadResourceFromDrive: aFoldername , filename)]).