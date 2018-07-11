sounds
createSoundOnDisk
	self createFolder: self testResourceFolder.
	self squeakSamplesSound
		storeWAVOnFileNamed: self testSoundPathWAV;
		storeAIFFOnFileNamed: self testSoundPathAIFF.