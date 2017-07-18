*GameMecha-Animations-Parallel
finishLoading
	self isCurrentlyLoading
		ifTrue: [self loadingLock wait].