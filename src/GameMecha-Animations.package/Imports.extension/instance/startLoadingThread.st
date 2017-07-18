*GameMecha-Animations-Parallel
startLoadingThread
	[self burndownQueue. self loadingLock signal] fork.