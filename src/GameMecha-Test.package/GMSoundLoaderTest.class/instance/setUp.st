running
setUp
	super setUp.
	self resourceManager: (GMSoundLoader new
		loudness: 0.0;
		pauseMusic;
		yourself).
	GMTestResourceFixtures createSoundOnDisk.