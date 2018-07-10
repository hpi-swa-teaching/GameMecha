key events
gmRegisterKeyEvent: aBlock forKey: aKeyCharacter
	(GMKeyHandler keyLookup includes: aKeyCharacter) ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToEventMappings at: aKeyCharacter put: aBlock.
	