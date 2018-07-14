filesystem
convertToRelativePath: aFilename
	^ (FileDirectory uri: aFilename) fullName allButFirst: FileDirectory default fullName size +1 