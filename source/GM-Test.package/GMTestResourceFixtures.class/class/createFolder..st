utility
createFolder: aFoldername
	| folderName |
	folderName := (aFoldername subStrings: FileDirectory slash) at: 1.
	(FileDirectory default directoryExists: folderName)
		ifFalse: [FileDirectory default createDirectory: folderName].