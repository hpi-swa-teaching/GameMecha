storing
sampledSoundStringFromSound: aSound withSamplesIn: aSelector andSamplingRate: aNumber
	aSound setSamples: #[] samplingRate: aNumber.
	^ (WriteStream on: '')
		store: aSound;
		nextPutAll: ' setSamples: (SoundBuffer fromByteArray: self ';
		nextPutAll: aSelector asString;
		nextPutAll: ') samplingRate: ', aNumber;
		contents