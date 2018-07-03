testing
testMethodRegistration
	self deny: [self testValue = self class settedTestValue].
	self keyTestMorph registerMethodInvocation: #setTestValue on: self  forKey: $s.
	(self class testKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyTestMorph. 
	self keyTestMorph evaluateRegisteredEvents.
	self assert: [self testValue = self class settedTestValue].
	self testValue: nil.
	(self class testKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyTestMorph.
	self deny: [self testValue = self class settedTestValue].