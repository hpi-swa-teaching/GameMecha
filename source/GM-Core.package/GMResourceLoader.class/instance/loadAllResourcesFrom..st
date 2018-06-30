as yet unclassified
loadAllResourcesFrom: aFoldername
	| foldername |
	foldername := self ensureSlashEnding: aFoldername.
	self cache addAll: ((self filenamesAtDir: foldername)
		collect: [:filename | (self convertToRelativePath: foldername , filename) -> (self loadResourceFromDrive: foldername , filename)]).