as yet unclassified
setUp
	self soundManager: (GMSoundManager instance loudness: 0.0).
	self soundManager 
		flushCache;
		loudness: 0.0;
		pauseMusic.
	self assert: [self soundManager cache size == 0].
	TestResourceFixtures createSoundOnDisk.