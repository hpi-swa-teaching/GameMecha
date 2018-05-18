as yet unclassified
prepareTest
	self soundManager 
		flushCache;
		loudness: 0.0;
		pauseMusic.
	self assert: [self soundManager cache size == 0].