testing
testBlockRegistration
	self deny: [self testValue = self class settedTestValue].
	self keyMorph gmRegisterKeyEvent: [self testValue: 1] forKey: $s.
	(self class testKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyMorph. 
	self keyMorph gmEvaluateRegisteredEvents.
	self assert: [testValue = self class settedTestValue].
	self testValue: nil.
	(self class testKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyMorph.
	self deny: [self testValue = self class settedTestValue].