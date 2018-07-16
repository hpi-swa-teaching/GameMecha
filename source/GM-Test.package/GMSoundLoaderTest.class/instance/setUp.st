testing
setUp
	super setUp.
	self resourceManager: (GMSoundLoader new
		loudness: 0.0;
		pauseMusic).
	GMTestResourceFixtures createSoundOnDisk.