as yet unclassified
soundManager
	^ SoundManager ifNil: [self soundManager: GMSoundManager new]