internals
fileExists: localPath
	FileDirectory
		splitName: (FileDirectory uri: localPath) fullName
		to: [:dir :file | ^ (FileDirectory on: dir) fileExists: file].