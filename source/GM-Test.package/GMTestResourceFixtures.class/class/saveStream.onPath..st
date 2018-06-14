utility
saveStream: aStream onPath: aName
	(FileDirectory new
		forceNewFileNamed: ((FileDirectory uri: aName) name))
			nextPutAll: (aStream contents);
			close.