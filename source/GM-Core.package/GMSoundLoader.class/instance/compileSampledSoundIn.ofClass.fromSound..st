as yet unclassified
compileSampledSoundIn: aMethodSymbol ofClass: aClass fromSound: sound
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: (aMethodSymbol asString , String cr , '"This is an auto-generated helper method, do not use this."', String cr, ' ^ ');
		yourself.
	sound
		setSamples: #[] samplingRate: 44100;
		storeOn: stream.
	stream nextPutAll: ' setSamples: (SoundBuffer fromByteArray: self ', aMethodSymbol asString, 'Samples) samplingRate: 44100'.
	aClass class compile: stream contents.
	