as yet unclassified
compileSampledSoundIn: aMethodSymbol ofClass: aClass fromSound: sound
	| stream |
	sound setSamples: #[] samplingRate: 44100.
	stream := (WriteStream on: '') 
		nextPutAll: (aMethodSymbol asString , String cr , '"This is an auto-generated method"', String cr, ' ^ ');
		yourself.
	sound storeOn: stream.
	stream nextPutAll: ' setSamples: (SoundBuffer fromByteArray: self ', aMethodSymbol asString, 'Samples) samplingRate: 44100'.
	aClass class compile: stream contents.
	