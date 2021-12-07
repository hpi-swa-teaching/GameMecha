utility
clearResourcesOnDisk: aFoldername
	(FileDirectory uri: (aFoldername)) assureExistence recursiveDelete.