internals
deleteIfExists: localPath
	FileDirectory
		splitName: (FileDirectory uri: localPath) fullName
		to: [:dir :file | ^ (FileDirectory on: dir) deleteFileNamed: file].