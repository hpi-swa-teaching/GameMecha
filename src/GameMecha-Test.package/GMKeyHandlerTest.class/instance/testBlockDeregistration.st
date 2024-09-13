test cases
testBlockDeregistration
	self keyMorph gmRegisterBlock: [self currentTestValue: self class assignedValue] forKey: self keyCharacter.
	self keyMorph gmDeregisterBlockForKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue isNil].