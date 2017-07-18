*GameMecha-Animations-Parallel
addToLoadingFileSize: sizeToLoad
	self loadingProgressValues:
		(self loadingProgressValues key
		-> (self loadingProgressValues value + sizeToLoad)).