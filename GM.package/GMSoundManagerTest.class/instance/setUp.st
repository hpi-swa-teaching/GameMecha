as yet unclassified
setUp
	self resourceManager: (GMSoundManager instance loudness: 0.0).
	self resourceManager
		loudness: 0.0;
		pauseMusic;
		flushCache.
	TestResourceFixtures createSoundOnDisk.