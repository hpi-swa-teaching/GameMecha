as yet unclassified
testFlushCache
	super testFlushCache.
	self should: [self resourceManager cache size ~ 0] raise: Error.