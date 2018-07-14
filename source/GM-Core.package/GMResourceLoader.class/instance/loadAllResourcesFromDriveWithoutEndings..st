as yet unclassified
loadAllResourcesFromDriveWithoutEndings: aFoldername
	self loadAllResourcesFromDrive: aFoldername withNameFunction: [:foldername :filename |
		self removeFileendingFrom: (self defaultNameFunction value: foldername value: filename)].