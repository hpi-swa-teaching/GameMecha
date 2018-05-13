as yet unclassified
testFlushCache
	self soundManager flushCache.
	self 
		should: [self soundManager playSound: self class testSoundNameWAV] raise: Error;
		assert: [self soundManager cache size = 0].