accessing
loadedFileSize
	loadedFileSize ifNil: [self loadedFileSize: 0].
	^ loadedFileSize.