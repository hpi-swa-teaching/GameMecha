sounds
createSoundOnDisk
	self createFolder: self testResourceFolder.
	self squeakSampledSound
		storeWAVOnFileNamed: self testSoundPathWAV;
		storeAIFFOnFileNamed: self testSoundPathAIFF.