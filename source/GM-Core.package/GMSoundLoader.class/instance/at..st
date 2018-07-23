accessing
at: aString
	^ (super at: aString)
		loudness: self loudness;
		yourself