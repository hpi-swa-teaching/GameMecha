as yet unclassified
playSound: aString
	(self cache at: aString ifAbsent: [self error: #SoundNotLoaded]) 
		loudness: self loudness;
		play.