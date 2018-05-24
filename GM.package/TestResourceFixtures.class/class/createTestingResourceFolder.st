images
createTestingResourceFolder
	| folderName |
	folderName := (self testResourceFolder subStrings: '/') at: 1.
	(FileDirectory default directoryExists: folderName) 
		ifFalse: [FileDirectory default createDirectory: folderName].