key events
gmRegisterKeyEvent: aBlock forKey: aCharacter
	(GMKeyHandler keyLookup includes: aCharacter) ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToEventMappings at: aCharacter put: aBlock.
	