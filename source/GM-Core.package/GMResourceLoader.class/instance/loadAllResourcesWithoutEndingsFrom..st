as yet unclassified
loadAllResourcesWithoutEndingsFrom: aFoldername
	self loadAllResourcesFrom: aFoldername withNameFunction: [:foldername :filename |
		self removeFileendingFrom: (self defaultNameFunction value: foldername value: filename)].