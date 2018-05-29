as yet unclassified
testFlushCache
	super testFlushCache.
	self should: [self resourceManager playSound: TestResourceFixtures testSoundNameWAV] raise: Error.