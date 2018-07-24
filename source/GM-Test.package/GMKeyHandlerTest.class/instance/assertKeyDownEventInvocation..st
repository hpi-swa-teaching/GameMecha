testing
assertKeyDownEventInvocation: aBlock
	(self createKeyboardEventOfType: #keyDown withValue: self keyValue) sentTo: self keyMorph.
	self keyMorph gmEvaluateRegisteredEvents.
	self assert: aBlock value equals: true.