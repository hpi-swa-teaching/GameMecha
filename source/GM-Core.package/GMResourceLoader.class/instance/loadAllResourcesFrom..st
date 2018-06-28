as yet unclassified
loadAllResourcesFrom: aFoldername
	| foldername |
	self flag: #refactorAndElminiateDuplicaton.
	foldername := self ensureSlashEnding: aFoldername.
	self cache addAll: (((self filenamesAtDir: foldername) 
		select: [:filename | self isSupportedType: (self extensionFromFilename: filename)])
		collect: [:filename | (self convertToRelativePath: foldername , filename) -> (self loadResourceFromDrive: foldername , filename)]).