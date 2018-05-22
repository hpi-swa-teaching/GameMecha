running
prepareTest
	self imageManager flushCache.
	self assert: [self imageManager cache size == 0].