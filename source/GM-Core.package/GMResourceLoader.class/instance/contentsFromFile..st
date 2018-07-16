filesystem
contentsFromFile: aFilename
	^ (FileStream readOnlyFileNamed: (FileDirectory default / aFilename) fullName) binary contents base64Encoded