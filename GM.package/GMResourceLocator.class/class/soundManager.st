as yet unclassified
soundManager
	^ SoundManager ifNil: [SoundManager := GMSoundManager new]