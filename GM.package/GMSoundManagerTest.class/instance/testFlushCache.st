as yet unclassified
testFlushCache
	self soundManager flushCache.
	self 
		should: [self soundManager playSound: self class testSoundName] raise: Error;
		assert: [self soundManager cache size = 0].