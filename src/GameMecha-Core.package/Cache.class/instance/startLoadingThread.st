io
startLoadingThread
	[self burndownQueue. self loadingLock signal] fork.