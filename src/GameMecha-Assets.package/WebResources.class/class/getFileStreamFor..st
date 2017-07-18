as yet unclassified
getFileStreamFor: localPath
	^ FileStream newFileNamed: (FileDirectory uri: localPath) fullName.