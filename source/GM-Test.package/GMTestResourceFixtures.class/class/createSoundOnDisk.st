images
createSoundOnDisk
	self createTestingResourceFolder.
	self squeakSamplesSound
		storeWAVOnFileNamed: self testResourceFolder , self testSoundNameWAV;
		storeAIFFOnFileNamed: self testResourceFolder , self testSoundNameAIFF.