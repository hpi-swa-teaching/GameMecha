test cases
testBlockRegistration
	self deny: [self currentTestValue = self class assignedValue].
	self keyMorph gmRegisterBlock: [self currentTestValue: self class assignedValue] forKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue = self class assignedValue] 
		then: [self resetCurrentTestValue].
	self assertKeyboardEventOfType: #keyUp 
		evaluates: [self currentTestValue isNil].