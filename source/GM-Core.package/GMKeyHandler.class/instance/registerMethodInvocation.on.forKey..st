key events
registerMethodInvocation: aMethod on: aReceiver forKey: aKeyCharacter
	(GMKeyHandler keyLookup includes: aKeyCharacter) ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToMethodMappings at: aKeyCharacter put: aReceiver -> aMethod.
	
	