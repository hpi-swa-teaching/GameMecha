test cases
testMethodRegistration
	self deny: [self testedValue = self class assignedValue].
	self keyMorph gmRegisterMethodInvocation: #setTestValue on: self forKey: $s.
	self assertKeyDownUpWorks.