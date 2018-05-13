running
prepareTest
	self cache flushCache.
	self assert: [cache imageCache size == 0].