as yet unclassified
compileSampledSoundIn: aSelector inInstance: anInstance fromSound: aSound
	aSound setSamples: #[] samplingRate: 44100.
	self compileMethod: aSelector inInstance: anInstance fromString: ((WriteStream on: '')
		store: aSound;
		nextPutAll: ' setSamples: (SoundBuffer fromByteArray: self ', aSelector asString, 'Samples) samplingRate: 44100';
		contents).
	