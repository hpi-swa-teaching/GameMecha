as yet unclassified
loadAllResourcesFrom: aFoldername withNameFunction: aBlock
	| foldername |
	foldername := self ensureSlashEnding: aFoldername.
	self cache addAll: ((self filenamesAtDir: foldername)
		collect: [:filename | (aBlock value: foldername value: filename) -> (self loadResourceFromDrive: foldername , filename)]).