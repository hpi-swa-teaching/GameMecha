*GameMecha-Assets-Parallel
finishLoading
	self isCurrentlyLoading
		ifTrue: [self loadingLock wait].