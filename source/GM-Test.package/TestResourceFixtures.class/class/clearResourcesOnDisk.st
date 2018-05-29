utility
clearResourcesOnDisk
	(FileDirectory uri: (self testResourceFolder)) deleteLocalFiles. 
	FileDirectory default deleteDirectory: self testResourceFolder.