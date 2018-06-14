as yet unclassified
setUp
	self resourceManager: (GMResourceLocator soundManager
		loudness: 0.0;
		pauseMusic).
	super setUp.
	GMTestResourceFixtures createSoundOnDisk.