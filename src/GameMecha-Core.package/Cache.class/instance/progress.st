io
progress
	(self loadingFileSize == 0) ifTrue: [^0].
	^ (self loadedFileSize) / (self loadingFileSize).