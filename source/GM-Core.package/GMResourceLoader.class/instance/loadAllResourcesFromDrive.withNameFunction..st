loading
loadAllResourcesFromDrive: aFoldername withNameFunction: aBlock
	| adaptedFoldername |
	adaptedFoldername := aFoldername, (self ensureSlashEnding: aFoldername).
	self cache addAll: ((self filenamesAtDir: adaptedFoldername)
		collect: [:filename | (aBlock value: adaptedFoldername value: filename) -> 
			(self resourceFromDrive: adaptedFoldername, filename)]).