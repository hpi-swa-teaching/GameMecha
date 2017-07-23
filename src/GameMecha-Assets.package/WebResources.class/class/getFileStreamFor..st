internals
getFileStreamFor: localPath
	^ FileStream newFileNamed: (FileDirectory uri: localPath) fullName.