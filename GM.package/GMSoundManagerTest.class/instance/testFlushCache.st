as yet unclassified
testFlushCache
	self soundManager flushCache.
	self 
		should: [self soundManager playSound: TestResourceFixtures testSoundNameWAV] raise: Error;
		assert: [self soundManager cache size = 0].