utility
createTestingResourceFolder
	| folderName |
	folderName := (self testResourceFolder subStrings: FileDirectory slash) at: 1.
	(FileDirectory default directoryExists: folderName) 
		ifFalse: [FileDirectory default createDirectory: folderName].