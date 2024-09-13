test cases
testMethodRegistration
	self deny: [self currentTestValue = self class assignedValue].
	self keyMorph gmRegisterMethodInvocation: #registrationTestSetCurrentValue on: self forKey: self keyCharacter.
	self assertKeyboardEventOfType: #keyDown 
		evaluates: [self currentTestValue = self class assignedValue] 
		then: [self resetCurrentTestValue].
	self assertKeyboardEventOfType: #keyUp 
		evaluates: [self currentTestValue isNil].