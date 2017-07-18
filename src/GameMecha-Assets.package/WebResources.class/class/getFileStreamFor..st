as yet unclassified
getFileStreamFor: localPath
	FileDirectory
		splitName: (FileDirectory uri: localPath) fullName
		to: [:dir :file | ^ (FileDirectory on: dir) fileNamed: file].