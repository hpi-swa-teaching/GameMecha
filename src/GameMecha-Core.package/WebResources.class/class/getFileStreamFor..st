as yet unclassified
getFileStreamFor: localPath
	^ FileStream newFileNamed: 
		(self makePathPlatformIndependant: localPath).