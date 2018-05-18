as yet unclassified
playMusic: aString
	self currentMusic: (RepeatingSound repeatForever: ((self cache at: aString ifAbsent: [self error: #SoundNotLoaded]) 
		loudness: self loudness)).
	self currentMusic play.