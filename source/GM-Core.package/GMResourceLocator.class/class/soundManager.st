as yet unclassified
soundManager
	^ SoundManager ifNil: [SoundManager := GMSoundLoader new]