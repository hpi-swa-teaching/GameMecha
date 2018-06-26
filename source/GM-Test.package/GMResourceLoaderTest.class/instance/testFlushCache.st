as yet unclassified
testFlushCache
	self resourceManager flushCache.
	self assert: [self resourceManager cache size == 0].