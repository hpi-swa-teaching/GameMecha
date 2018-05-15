as yet unclassified
prepareTest
	self soundManager flushCache.
	self assert: [self soundManager cache size == 0].