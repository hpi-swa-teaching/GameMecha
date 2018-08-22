storing
sampledSoundStringFromSound: aSound withSamplesIn: aSelector
	aSound setSamples: #[] samplingRate: 44100.
	^ (WriteStream on: '')
		store: aSound;
		nextPutAll: ' setSamples: (SoundBuffer fromByteArray: self ';
		nextPutAll: aSelector asString;
		nextPutAll: ') samplingRate: 44100';
		contents