as yet unclassified
compileSampledSoundIn: aMethodSymbol inInstance: anInstance fromSound: aSound
	self compileMethod: aMethodSymbol inInstance: anInstance fromString: ((WriteStream on: '')
		store: aSound;
		nextPutAll: ' setSamples: (SoundBuffer fromByteArray: self ', aMethodSymbol asString, 'Samples) samplingRate: 44100';
		contents).
	