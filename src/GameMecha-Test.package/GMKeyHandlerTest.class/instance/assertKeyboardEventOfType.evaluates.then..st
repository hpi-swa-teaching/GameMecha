testing
assertKeyboardEventOfType: aType evaluates: anAssertionBlock then: aCleanUpBlock
	(self createKeyboardEventOfType: aType withValue: self keyValue) sentTo: self keyMorph. 
	self keyMorph gmEvaluateRegisteredEvents.
	self assert: anAssertionBlock value equals: true.
	aCleanUpBlock value.