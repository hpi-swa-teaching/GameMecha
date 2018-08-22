key events
gmDeregisterBlockForKey: aCharacter
	(self class keyLookup includes: aCharacter) 
		ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToBlockMappings removeKey: aCharacter ifAbsent: [].