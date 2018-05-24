images
createSoundOnDisk
	| defaultDirectory sampledSound |
	self createTestingResourceFolder.
	sampledSound := self squeakSamplesSound.
	sampledSound setSamples: (SoundBuffer fromByteArray: self squeakWAV) samplingRate: 44100.
	defaultDirectory := FileDirectory default.
	FileDirectory setDefaultDirectory: defaultDirectory pathName, FileDirectory slash , self testResourceFolder.
	sampledSound storeWAVOnFileNamed: 'squeak.wav'.
	sampledSound storeAIFFOnFileNamed: 'squeak.aiff'.
	FileDirectory setDefaultDirectory: defaultDirectory pathName.