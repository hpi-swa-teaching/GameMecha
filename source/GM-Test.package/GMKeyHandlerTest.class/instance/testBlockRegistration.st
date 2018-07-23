test cases
testBlockRegistration
	self deny: [self testedValue = self class assignedValue].
	self keyMorph gmRegisterKeyEvent: [self testedValue: self class assignedValue] forKey: $s.
	self assertKeyDownUpWorks.