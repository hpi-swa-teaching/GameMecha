as yet unclassified
sampledSound: aString
	^ (self cache at: aString ifAbsent: [self error: #SoundNotLoaded]) 
		loudness: self loudness;
		yourself.