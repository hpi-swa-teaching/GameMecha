as yet unclassified
loadAllResourcesWithoutEndingsFrom: aFoldername
	| foldername |
	foldername := self ensureSlashEnding: aFoldername.
	self cache addAll: ((self filenamesAtDir: foldername)
		collect: [:filename | (self removeFileendingFrom: (self convertToRelativePath: foldername , filename)) -> (self loadResourceFromDrive: aFoldername , filename)]).