testing
testMethodRegistration
	self deny: [self testValue = self class settedTestValue].
	self keyMorph gmRegisterMethodInvocation: #setTestValue on: self  forKey: $s.
	(self class testKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyMorph. 
	self keyMorph gmEvaluateRegisteredEvents.
	self assert: [self testValue = self class settedTestValue].
	self testValue: nil.
	(self class testKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyMorph.
	self deny: [self testValue = self class settedTestValue].