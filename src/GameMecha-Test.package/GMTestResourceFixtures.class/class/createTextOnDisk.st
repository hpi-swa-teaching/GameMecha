text
createTextOnDisk
	self createFolder: self testResourceFolder.
	(StandardFileStream forceNewFileNamed: self testTextPath)
		nextPutAll: self testText;
		close.