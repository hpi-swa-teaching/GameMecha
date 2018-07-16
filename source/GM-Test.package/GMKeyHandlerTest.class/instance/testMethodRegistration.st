test cases
testMethodRegistration
	self deny: [self testedValue = self class assignedValue].
	self keyMorph gmRegisterMethodInvocation: #setTestValue on: self  forKey: $s.
	(self class createKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyMorph. 
	self keyMorph gmEvaluateRegisteredEvents.
	self assert: [self testedValue = self class assignedValue].
	self testedValue: nil.
	(self class createKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyMorph.
	self deny: [self testedValue = self class assignedValue].