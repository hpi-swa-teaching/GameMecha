accessing
loadingFileSize
	loadingFileSize ifNil: [self loadingFileSize: 0.].
	^ loadingFileSize.