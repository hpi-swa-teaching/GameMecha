key events
gmRegisterMethodInvocation: aSelector on: aReceivingObject forKey: aCharacter
	(self class keyLookup includes: aCharacter) 
		ifFalse: [self error: 'The character you specified does not belong to a valid key.'].
	self keyToMethodMappings at: aCharacter put: aReceivingObject -> aSelector.
	
	