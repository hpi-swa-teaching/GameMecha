as yet unclassified
testFlushCache
	self soundManager loadResourceIntoCache: self soundTest.
	self soundManager flushCache.
	self should: [self soundManager playSound: self soundTest] raise: Error.