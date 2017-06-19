accessing
loadingLock
	loadingLock ifNil: [self loadingLock: Semaphore new].
	^ loadingLock