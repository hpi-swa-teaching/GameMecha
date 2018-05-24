images
createSoundOnDisk
	| sampledSound |
	self createTestingResourceFolder.
	sampledSound := self squeakSamplesSound.
	sampledSound 
		setSamples: (SoundBuffer fromByteArray: self squeakSoundSamples) samplingRate: 44100;
		storeWAVOnFileNamed: self testResourceFolder , 'squeak.wav';
		storeAIFFOnFileNamed: self testResourceFolder , 'squeak.aiff'.