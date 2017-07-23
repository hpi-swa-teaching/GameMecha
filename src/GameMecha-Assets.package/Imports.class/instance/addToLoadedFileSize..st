parallel
addToLoadedFileSize: sizeLoaded
	self loadingProgressValues:
		((self loadingProgressValues key + sizeLoaded)
		-> self loadingProgressValues value).