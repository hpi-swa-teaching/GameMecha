parallel
startLoadingThread
	[Processor yield. self burndownQueue. self loadingLock signal] fork.