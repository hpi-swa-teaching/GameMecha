as yet unclassified
setUp
	self resourceManager: (GMSoundLoader new
		loudness: 0.0;
		pauseMusic).
	super setUp.
	GMTestResourceFixtures createSoundOnDisk.