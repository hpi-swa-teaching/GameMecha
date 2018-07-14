as yet unclassified
loadAllResourcesFromDrive: aFoldername withNameFunction: aBlock
	| foldername |
	foldername := aFoldername, (self ensureSlashEnding: aFoldername).
	self cache addAll: ((self filenamesAtDir: foldername)
		collect: [:filename | (aBlock value: foldername value: filename) -> (self resourceFromDrive: foldername , filename)]).