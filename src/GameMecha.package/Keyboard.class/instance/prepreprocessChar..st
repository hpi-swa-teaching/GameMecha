keyHandling
prepreprocessChar: aCharacter
	^ self preprocessChar: (self makePlatformIndependent: aCharacter).