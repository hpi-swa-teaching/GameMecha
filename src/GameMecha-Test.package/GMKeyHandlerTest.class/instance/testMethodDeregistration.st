test cases
testMethodDeregistration
	self keyMorph gmRegisterMethodInvocation: #registrationTestSetCurrentValue on: self forKey: self keyCharacter.
	self keyMorph gmDeregisterMethodInvocationForKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue isNil].